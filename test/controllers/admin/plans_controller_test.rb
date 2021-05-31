require "test_helper"

class Admin::PlansControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_plans_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_plans_edit_url
    assert_response :success
  end
end
