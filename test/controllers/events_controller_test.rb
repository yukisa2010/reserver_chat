require "test_helper"

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get events_update_url
    assert_response :success
  end

  test "should get index" do
    get events_index_url
    assert_response :success
  end
end
