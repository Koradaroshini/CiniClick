class Booking < ApplicationRecord
  belongs_to :showtime

  before_save :calculate_total_amount

  def update_seat_count!
    showtime.update(available_seats: showtime.available_seats - number_of_tickets)
  end
  private

  def calculate_total_amount
    self.total_amount = number_of_tickets * showtime.price
  end
end
