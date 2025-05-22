json.extract! showtime, :id, :movie_id, :theater_id, :show_date, :available_seats, :created_at, :updated_at
json.url showtime_url(showtime, format: :json)
