require 'test_helper'

class RunsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @run = runs(:one)
    @user = users(:one)
    sign_in @user
  end

  test "should get new" do
    get new_run_url
    assert_response :success
  end

  test "should create run" do
    assert_difference('Run.count') do
      post runs_url, params: { run: { user_id: @user } }
    end

    assert_redirected_to root_url
  end
end
