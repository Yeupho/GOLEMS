require 'test_helper'

class WalkInsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get walk_ins_index_url
    assert_response :success
  end

end
