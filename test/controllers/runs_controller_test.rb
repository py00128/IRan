require 'test_helper'

class RunsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @run = runs(:one)
    @user = users(:one)
  end

  test "should get new" do
    get new_user_run_url(@user)
    assert_response :success
  end

  test "should create run" do
    assert_difference('Run.count') do
      post user_runs_url(@user), params: { run: { user_id: @user } }
    end

    assert_redirected_to root_url
  end
end
