class ShowtimeGalleryController < ApplicationController
  def index
   if params[:theater_id].present?
      # Fetch showtimes for a specific theater
      @theater = Theater.find_by(id: params[:theater_id])

      if @theater
        @showtimes = @theater.showtimes
      else
        redirect_to theaters_path, alert: "Theater not found."
      end
   else
      # Fallback: Show all showtimes or redirect
      @theater = nil
      @showtimes = Showtime.all
   end
  end
end

