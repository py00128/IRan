require 'test_helper'

# tests the home controller
class HomeControllerTest < ActionDispatch::IntegrationTest

  # tests the home action.
  test "should get home" do
    get root_url
    assert_response :success # tests whether we can perform a get on home.

    assert_template layout: 'application'

    assert_select 'title', 'IRan'
  end

end
