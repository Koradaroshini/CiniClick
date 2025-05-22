require "test_helper"

class ShowtimeGalleryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get showtime_gallery_index_url
    assert_response :success
  end
end
