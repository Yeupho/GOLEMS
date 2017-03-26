require 'test_helper'

class CustomerEventProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer_event_product = customer_event_products(:one)
  end

  test "should get index" do
    get customer_event_products_url
    assert_response :success
  end

  test "should get new" do
    get new_customer_event_product_url
    assert_response :success
  end

  test "should create customer_event_product" do
    assert_difference('CustomerEventProduct.count') do
      post customer_event_products_url, params: { customer_event_product: {archive: @customer_event_product.archive, customer_event_id: @customer_event_product.customer_event_id, pickup_status_id: @customer_event_product.pickup_status_id, product_id: @customer_event_product.product_id, quantity: @customer_event_product.quantity } }
    end

    assert_redirected_to customer_event_product_url(CustomerEventProduct.last)
  end

  test "should show customer_event_product" do
    get customer_event_product_url(@customer_event_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_customer_event_product_url(@customer_event_product)
    assert_response :success
  end

  test "should update customer_event_product" do
    patch customer_event_product_url(@customer_event_product), params: { customer_event_product: {archive: @customer_event_product.archive, customer_event_id: @customer_event_product.customer_event_id, pickup_status_id: @customer_event_product.pickup_status_id, product_id: @customer_event_product.product_id, quantity: @customer_event_product.quantity } }
    assert_redirected_to customer_event_product_url(@customer_event_product)
  end

  test "should destroy customer_event_product" do
    assert_difference('CustomerEventProduct.count', -1) do
      delete customer_event_product_url(@customer_event_product)
    end

    assert_redirected_to customer_event_products_url
  end
end
