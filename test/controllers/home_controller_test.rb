require 'test_helper'

# tests the home controller
class HomeControllerTest < ActionDispatch::IntegrationTest

  # tests the home action.
  test "should get home" do
    get root_url
    assert_response :success # tests whether we can perform a get on home.

    assert_template layout: 'application'

    assert_select 'title', 'iRan Application'
  end

  test "should get contact" do
    get contact_url
    assert_response :success

    assert_template layout: 'application'

    assert_select 'h1', 'iRan'
    assert_select 'h1', 'Contact Us'
    assert_select 'p', 'Complete the following form to get in touch with us.'

  end

end
