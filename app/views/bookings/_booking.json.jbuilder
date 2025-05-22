json.extract! booking, :id, :showtime_id, :number_of_tickets, :total_amount, :created_at, :updated_at
json.url booking_url(booking, format: :json)
