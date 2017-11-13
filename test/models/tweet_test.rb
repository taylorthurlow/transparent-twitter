require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  def setup_client
    return Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['SECRET_CONSUMER_KEY']
      config.consumer_secret = ENV['SECRET_CONSUMER_SECRET']
      config.access_token = ENV['SECRET_ACCESS_TOKEN']
      config.access_token_secret = ENV['SECRET_ACCESS_TOKEN_SECRET']
    end
  end

  test 'should batch factory' do
    client = setup_client
    response_tweet = client.status(920818672943316992)
    assert_difference('Tweet.count') do
      Tweet.batch_factory(response_tweet)
    end
  end

  test 'should not batch factory' do
    client = setup_client
    # tweet is marked as "possibly sensitive"
    response_tweet = client.status(929460634546294784)
    assert_no_difference('Tweet.count') do
      Tweet.batch_factory(response_tweet)
    end
  end
end
