
class MoviesGalleryController < ApplicationController
  # Display movies with search functionality
   before_action :authenticate_user!  # Ensure the user is logged in
  def index
     if params[:search].present?
      @movies = Movie.where("title LIKE ?", "%#{params[:search]}%")
     else
      @movies = Movie.order(updated_at: :desc)  # Display latest admin-updated data first
     end
  end

  # Book Ticket Action (Placeholder)
  def book_ticket
    @movie = Movie.find(params[:id])
    # For now, we'll just display a message. 
    # Implement actual booking logic in future.
    flash[:notice] = "Ticket booked successfully for #{@movie.title}"
    redirect_to movies_gallery_path
  end
end
