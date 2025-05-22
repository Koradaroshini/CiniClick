class Showtime < ApplicationRecord
  belongs_to :theater
  belongs_to :movie
  has_many :bookings, dependent: :destroy

  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :available_seats, numericality: { greater_than_or_equal_to: 0 }

  def seats_available?(ticket_count)
    available_seats >= ticket_count
  end
end
