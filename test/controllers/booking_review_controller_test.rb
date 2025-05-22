require "test_helper"

class BookingReviewControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get booking_review_show_url
    assert_response :success
  end
end
