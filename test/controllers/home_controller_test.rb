require 'test_helper'

# tests the home controller
class HomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in @user
  end

  # tests the home action.
  test "should get home" do
    get root_url
    assert_response :success # tests whether we can perform a get on home.

    assert_template layout: 'application'

    assert_select 'title', 'IRan'
  end

end
