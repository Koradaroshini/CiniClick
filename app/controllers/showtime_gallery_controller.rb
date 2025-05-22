class ShowtimeGalleryController < ApplicationController
  def index
    # Fetch all showtimes with their related movie and theater information
    # if params[:theater_id].present?
    # @theater = Theater.find(params[:theater_id])
    # @showtimes = @theater.showtimes
    # else
    # # fallback, maybe show all showtimes or redirect
    #  @theater = nil
    #  @showtimes = Showtime.all
    # Or redirect somewhere else:
    #  redirect_to theaters_path, alert: "Theater not specified."
    # end
     
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

