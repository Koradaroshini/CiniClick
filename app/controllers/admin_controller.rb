class AdminController < ApplicationController
   before_action :authenticate_user!
  def login
    if request.post?
      if params[:username] == "roshini" && params[:password] == "123456"
        session[:admin] = "roshini"
        redirect_to admin_url

      else
        flash[:notice]= "Invalid username/password.please try again"
        render :action=> :login, status: :unprocessable_entity

      end
    end
  end


   def logout
     session[:admin]=nil
     flash[:notice]= "you are logout"
     redirect_to :action=> :login
   end

    def index
     @movies = Movie.all
    @theaters = Theater.all
    @showtimes = Showtime.all
    end
end
