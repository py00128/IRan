require 'test_helper'

class HelpsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @help = helps(:one)
  end

  test "should get new" do
    get new_help_url
    assert_response :success
  end

  test "should create help" do
    assert_difference('Help.count') do
      post helps_url, params: { help: { email: @help.email, message: @help.message, name: @help.name } }
    end

    assert_redirected_to root_url
  end
end
