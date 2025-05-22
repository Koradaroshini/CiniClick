class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
   before_action :authenticate_user!, unless: :public_controller?

  # Define which controllers are public (no authentication required)
  def public_controller?
    %w[home admin].include?(controller_name)
  end
  # Redirect to MoviesGallery after login
  def after_sign_in_path_for(resource)
    movies_gallery_path
  end
end
