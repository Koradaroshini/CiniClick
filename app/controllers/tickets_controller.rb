class TicketsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    @showtime = @booking.showtime
    @theater = @showtime.theater
  end
end
