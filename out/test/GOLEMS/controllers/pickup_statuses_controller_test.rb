require 'test_helper'

class PickupStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pickup_status = pickup_statuses(:one)
  end

  test "should get index" do
    get pickup_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_pickup_status_url
    assert_response :success
  end

  test "should create pickup_status" do
    assert_difference('PickupStatus.count') do
      post pickup_statuses_url, params: { pickup_status: { pickup_status_desc: @pickup_status.pickup_status_desc } }
    end

    assert_redirected_to pickup_status_url(PickupStatus.last)
  end

  test "should show pickup_status" do
    get pickup_status_url(@pickup_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_pickup_status_url(@pickup_status)
    assert_response :success
  end

  test "should update pickup_status" do
    patch pickup_status_url(@pickup_status), params: { pickup_status: { pickup_status_desc: @pickup_status.pickup_status_desc } }
    assert_redirected_to pickup_status_url(@pickup_status)
  end

  test "should destroy pickup_status" do
    assert_difference('PickupStatus.count', -1) do
      delete pickup_status_url(@pickup_status)
    end

    assert_redirected_to pickup_statuses_url
  end
end
