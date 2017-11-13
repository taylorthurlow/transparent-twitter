class Tweet < ActiveRecord::Base
  enum classification: [:unknown, :neither, :news, :opinion]

  scope :unclassified, -> { where(classification: 'unknown') }
  scope :classified, -> { where.not(classification: 'unknown') }

  validates :tweet_id, uniqueness: true

  def self.batch_factory(tweet)
    json = tweet.as_json
    retweeted = !json['retweeted_status'].nil?

    unless tweet.possibly_sensitive?# or retweeted
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
  rescue ActiveRecord::RecordInvalid => exception
    # doesn't matter, we'll just skip it
  end
end
