require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: {
        name: @user.name,
        profile_image: @user.profile_image,
        provider: @user.provider,
        secret: @user.secret,
        token: @user.token,
        uid: @user.uid
      }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should update user" do
    patch :update, id: @user, user: {
      name: @user.name,
      profile_image: @user.profile_image,
      provider: @user.provider,
      secret: @user.secret,
      token: @user.token,
      uid: @user.uid
    }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
