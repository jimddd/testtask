require "test_helper"

class PokerControllerTest < ActionDispatch::IntegrationTest
  test "should get leaderboard" do
    get poker_leaderboard_url
    assert_response :success
  end
end
