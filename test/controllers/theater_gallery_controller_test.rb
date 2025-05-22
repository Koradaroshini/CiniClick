require "test_helper"

class TheaterGalleryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get theater_gallery_index_url
    assert_response :success
  end
end
