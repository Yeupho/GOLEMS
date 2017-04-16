require 'test_helper'

class AboutControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get about_new_url
    assert_response :success
  end

  test "should get create" do
    get about_create_url
    assert_response :success
  end

end
