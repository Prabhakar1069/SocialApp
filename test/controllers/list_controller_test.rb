require "test_helper"

class ListControllerTest < ActionDispatch::IntegrationTest
  test "should get friend" do
    get list_friend_url
    assert_response :success
  end
end
