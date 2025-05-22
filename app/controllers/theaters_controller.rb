class TheatersController < ApplicationController
  before_action :set_theater, only: %i[ show edit update destroy ]

  # GET /theaters or /theaters.json
  def index
    @theaters = Theater.all
  end

  # GET /theaters/1 or /theaters/1.json

  # GET /theaters/new
  def new
    @theater = Theater.new
  end

  def show
    @showtimes = @theater.showtimes
    @movie = Movie.find_by(id: params[:movie_id]) if params[:movie_id]
  end

  # GET /theaters/1/edit
  def edit
      @theater = Theater.find(params[:id])
  end

  # POST /theaters or /theaters.json
  def create
    @theater = Theater.new(theater_params)

    respond_to do |format|
      if @theater.save
        format.html { redirect_to @theater, notice: "Theater was successfully created." }
        format.json { render :show, status: :created, location: @theater }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @theater.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /theaters/1 or /theaters/1.json
  def update
    respond_to do |format|
      if @theater.update(theater_params)
        format.html { redirect_to @theater, notice: "Theater was successfully updated." }
        format.json { render :show, status: :ok, location: @theater }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @theater.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /theaters/1 or /theaters/1.json
  def destroy
    @theater.destroy!

    respond_to do |format|
      format.html { redirect_to theaters_path, status: :see_other, notice: "Theater was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_theater
      @theater = Theater.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def theater_params
      params.require(:theater).permit(:name, :location, :number_of_seats)
    end

end
