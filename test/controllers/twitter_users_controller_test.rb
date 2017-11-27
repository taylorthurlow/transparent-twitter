require 'test_helper'

class TwitterUsersControllerTest < ActionController::TestCase
  setup do
    @twitter_user = twitter_users(:one)
  end

  test "should create twitter_user" do
    assert_difference('TwitterUser.count') do
      post :create, twitter_user: {
        name: @twitter_user.name,
        profile_image: @twitter_user.profile_image,
        screen_name: @twitter_user.screen_name,
        uid: @twitter_user.uid
      }
    end

    assert_redirected_to twitter_user_path(assigns(:twitter_user))
  end

  test "should update twitter_user" do
    patch :update, id: @twitter_user, twitter_user: {
      name: @twitter_user.name,
      profile_image: @twitter_user.profile_image,
      screen_name: @twitter_user.screen_name,
      uid: @twitter_user.uid
    }
    assert_redirected_to twitter_user_path(assigns(:twitter_user))
  end

  test "should destroy twitter_user" do
    assert_difference('TwitterUser.count', -1) do
      delete :destroy, id: @twitter_user
    end

    assert_redirected_to twitter_users_path
  end
end
