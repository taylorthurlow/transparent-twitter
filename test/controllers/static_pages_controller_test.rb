require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test 'should get trainer' do
    get :trainer
    assert_response :success
    assert_not_nil assigns(:tweet)
  end
end
