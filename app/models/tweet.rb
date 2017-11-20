require 'csv'

class Tweet < ActiveRecord::Base
  enum classification: [:unknown, :neither, :news, :opinion]

  scope :unclassified, -> { where(classification: 'unknown') }
  scope :classified, -> { where.not(classification: 'unknown') }

  validates :tweet_id, uniqueness: true

  def self.to_csv
    CSV.generate do |csv|
      Tweet.classified.each do |tweet|
        csv << [tweet.tweet_text.tr("\n", ' '), tweet.classification]
      end
    end
  end

  def self.batch_factory(tweet)
    json = tweet.as_json
    retweeted = !json['retweeted_status'].nil?

    unless tweet.possibly_sensitive? || retweeted
      return Tweet.create!(
        tweet_id: tweet.id,
        tweet_url: tweet.uri.to_s,
        tweet_text: json['full_text'],
        user_name: tweet.user.name,
        user_handle: tweet.user.screen_name,
        user_picture_url: tweet.user.profile_image_uri.to_s,
        classification: 0
      )
    end
  rescue ActiveRecord::RecordInvalid
    logger.info "Failed to create tweet with id: #{tweet.id}. Ignoring."
  end

  def self.client_init
    return Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['SECRET_CONSUMER_KEY']
      config.consumer_secret = ENV['SECRET_CONSUMER_SECRET']
      config.access_token = ENV['SECRET_ACCESS_TOKEN']
      config.access_token_secret = ENV['SECRET_ACCESS_TOKEN_SECRET']
    end
  end

  def self.check_user(user, num_tweets = 200)
    list = Tweet.build_tweet_list(user, num_tweets)
    response = Tweet.check_tone(list)
    puts response['document_tone']
  end

  def self.build_tweet_list(user, num_tweets = 200)
    tweets = Tweet.client_init.user_timeline(user, count: num_tweets, tweet_mode: 'extended')
    return tweets.map { |t| t.attrs[:full_text] }.join("\n").gsub(/[\u0080-\u00ff]/, '')
  end

  def self.check_tone(text_body)
    response = RestClient::Request.new(
      method: :post,
      url: 'https://gateway.watsonplatform.net/tone-analyzer/api/v3/tone',
      user: ENV['IBM_USERNAME'],
      password: ENV['IBM_PASSWORD'],
      payload: text_body,
      # payload: ERB::Util.url_encode(text_body),
      headers: {
        content_type: 'text/plain',
        params: {
          version: '2017-09-21',
          sentences: false
        }
      }
    ).execute

    return JSON.parse(response)
  rescue RestClient::ExceptionWithResponse => err
    puts "REQUEST TO WATSON API FAILED: #{err}"
  end
end
