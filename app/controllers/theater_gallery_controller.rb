class TheaterGalleryController < ApplicationController
  def index
    @movie = Movie.find_by(id: params[:movie_id])
    @theaters = Theater.includes(:showtimes).all
  end
end