require "test_helper"

class Admin::CustomerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_customer_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_customer_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_customer_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_customer_update_url
    assert_response :success
  end
end
