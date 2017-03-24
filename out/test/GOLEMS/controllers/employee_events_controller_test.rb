require 'test_helper'

class EmployeeEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee_event = employee_events(:one)
  end

  test "should get index" do
    get employee_events_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_event_url
    assert_response :success
  end

  test "should create employee_event" do
    assert_difference('EmployeeEvent.count') do
      post employee_events_url, params: { employee_event: { archive: @employee_event.archive, employee_id: @employee_event.employee_id, event_id: @employee_event.event_id } }
    end

    assert_redirected_to employee_event_url(EmployeeEvent.last)
  end

  test "should show employee_event" do
    get employee_event_url(@employee_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_event_url(@employee_event)
    assert_response :success
  end

  test "should update employee_event" do
    patch employee_event_url(@employee_event), params: { employee_event: { archive: @employee_event.archive, employee_id: @employee_event.employee_id, event_id: @employee_event.event_id } }
    assert_redirected_to employee_event_url(@employee_event)
  end

  test "should destroy employee_event" do
    assert_difference('EmployeeEvent.count', -1) do
      delete employee_event_url(@employee_event)
    end

    assert_redirected_to employee_events_url
  end
end
