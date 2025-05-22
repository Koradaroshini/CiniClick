require "application_system_test_case"

class ShowtimesTest < ApplicationSystemTestCase
  setup do
    @showtime = showtimes(:one)
  end

  test "visiting the index" do
    visit showtimes_url
    assert_selector "h1", text: "Showtimes"
  end

  test "should create showtime" do
    visit showtimes_url
    click_on "New showtime"

    fill_in "Available seats", with: @showtime.available_seats
    fill_in "Movie", with: @showtime.movie_id
    fill_in "Show date", with: @showtime.show_date
    fill_in "Theater", with: @showtime.theater_id
    click_on "Create Showtime"

    assert_text "Showtime was successfully created"
    click_on "Back"
  end

  test "should update Showtime" do
    visit showtime_url(@showtime)
    click_on "Edit this showtime", match: :first

    fill_in "Available seats", with: @showtime.available_seats
    fill_in "Movie", with: @showtime.movie_id
    fill_in "Show date", with: @showtime.show_date.to_s
    fill_in "Theater", with: @showtime.theater_id
    click_on "Update Showtime"

    assert_text "Showtime was successfully updated"
    click_on "Back"
  end

  test "should destroy Showtime" do
    visit showtime_url(@showtime)
    click_on "Destroy this showtime", match: :first

    assert_text "Showtime was successfully destroyed"
  end
end
