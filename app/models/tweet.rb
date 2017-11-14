require 'csv'

class Tweet < ActiveRecord::Base
  enum classification: [:unknown, :neither, :news, :opinion]

  scope :unclassified, -> { where(classification: 'unknown') }
  scope :classified, -> { where.not(classification: 'unknown') }

  validates :tweet_id, uniqueness: true

  def self.to_csv
    CSV.generate do |csv|
      Tweet.classified.each do |tweet|
        csv << [tweet.tweet_text.gsub("\n", ' '), tweet.classification]
      end
    end
  end

  # {
  #   "natural_language_classifier": [
  #     {
  #       "name": "nlc-transparent-twitter-natural-la-1510644211970",
  #       "plan": "standard",
  #       "credentials": {
  #         "url": "https://gateway.watsonplatform.net/natural-language-classifier/api",
  #         "username": "6266fe93-4c95-489d-9a89-30ecd524e962",
  #         "password": "aJJwR741jZ81"
  #       }
  #     }
  #   ]
  # }
  #
  # {
  #   "classifier_id" : "9ddbcfx239-nlc-18292",
  #   "name" : "TweetClassifier",
  #   "language" : "en",
  #   "created" : "2017-11-14T07:38:38.822Z",
  #   "url" : "https://gateway.watsonplatform.net/natural-language-classifier/api/v1/classifiers/9ddbcfx239-nlc-18292",
  #   "status" : "Training",
  #   "status_description" : "The classifier instance is in its training phase, not yet ready to accept classify requests"
  # }%

  def self.batch_factory(tweet)
    json = tweet.as_json
    retweeted = !json['retweeted_status'].nil?

    unless tweet.possibly_sensitive? or retweeted
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
end
