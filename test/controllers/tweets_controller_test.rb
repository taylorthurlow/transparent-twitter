require 'test_helper'

class TweetsControllerTest < ActionController::TestCase
  setup do
    @tweet = tweets(:tweet_one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tweets)
  end

  test "should create tweet" do
    assert_difference('Tweet.count') do
      post :create, tweet: {
        classification: @tweet.classification,
        text: @tweet.text,
        url: @tweet.url
      }
    end

    assert_redirected_to tweets_path
  end

  test "should update tweet" do
    patch :update, id: @tweet, tweet: {
      classification: @tweet.classification,
      text: @tweet.text,
      url: @tweet.url
    }
    assert_redirected_to tweets_path
  end

  test "should destroy tweet" do
    assert_difference('Tweet.count', -1) do
      delete :destroy, id: @tweet
    end

    assert_redirected_to tweets_path
  end
end
