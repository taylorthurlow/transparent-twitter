require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test 'should get home' do
    get :home
    assert_response :success
  end

  test 'should get results' do
    get :results, results: {"tones"=>[{"score"=>"0.659212", "tone_id"=>"joy", "tone_name"=>"Joy"}]},
      twitter_user_id: twitter_users(:one).id
    assert_response :success
    assert_not_nil assigns(:results)
    assert_not_nil assigns(:twitter_user)
  end
end
