class Booking < ApplicationRecord
  belongs_to :showtime

  before_save :calculate_total_amount

  def update_seat_count!
    showtime.update(available_seats: showtime.available_seats - number_of_tickets)
  end

  # before_save :reduce_seats


  private

  def calculate_total_amount
    self.total_amount = number_of_tickets * showtime.price
  end

  # def reduce_seats
  #   return if number_of_tickets.blank? || number_of_tickets.zero?

  #   # Reduce available seats only based on the number of tickets booked
  #   showtime.available_seats -= number_of_tickets
  #   showtime.save
  # end
end
