require "test_helper"

class MoviesGalleryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get movies_gallery_index_url
    assert_response :success
  end
end
