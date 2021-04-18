require 'test_helper'

class RunsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @run = runs(:one)
  end

  test "should get new" do
    get new_user_run_url(@run.userID)
    assert_response :success
  end

  test "should create run" do
    assert_difference('Run.count') do
      post user_runs_url(@run.userID), params: { run: { userID: @run.userID } }
    end

    assert_redirected_to user_run_url(Run.last)
  end
end
