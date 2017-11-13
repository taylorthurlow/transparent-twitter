require 'test_helper'

class TweetsControllerTest < ActionController::TestCase
  setup do
    @tweet = tweets(:tweet_one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:tweets)
  end

  test 'should create tweet' do
    assert_difference('Tweet.count') do
      post :create, tweet: {
        classification: @tweet.classification,
        tweet_id: rand(1..100000),
        tweet_text: @tweet.tweet_text,
        tweet_url: @tweet.tweet_url
      }
    end

    assert_redirected_to tweets_path
  end

  test 'should create training data' do
    count_before = Tweet.count
    get :create_training_data
    count_after = Tweet.count
    assert_includes 1..10, count_after - count_before
  end

  test 'should update tweet' do
    patch :update, id: @tweet, tweet: {
      classification: @tweet.classification,
      tweet_id: rand(1..100000),
      tweet_text: @tweet.tweet_text,
      tweet_url: @tweet.tweet_url
    }
    assert_redirected_to trainer_url
  end

  test 'should destroy tweet' do
    assert_difference('Tweet.count', -1) do
      delete :destroy, id: @tweet
    end

    assert_redirected_to trainer_url
  end
end
