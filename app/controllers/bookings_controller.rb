class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]
  before_action :set_showtime, only: [:new, :create]

  # GET /bookings or /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1 or /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
      if @showtime
      @booking = Booking.new(showtime_id: @showtime.id)
      else
      redirect_to showtime_gallery_index_path, alert: "Showtime not found."
      end
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings or /bookings.json
   def create
    @booking = Booking.new(booking_params)
    @booking.showtime_id = params[:showtime_id]

     if @showtime.seats_available?(@booking.number_of_tickets)
      if @booking.save
        redirect_to booking_review_path(@booking), notice: "Booking successfully created."
      else
        render :new, status: :unprocessable_entity
      end
     else
      redirect_to new_booking_path(showtime_id: @showtime.id), alert: "Not enough seats available."
     end
   end

  def booking_review
      @booking = Booking.find(params[:id])
  end
  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: "Booking was successfully updated." }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy!

    respond_to do |format|
      format.html { redirect_to bookings_path, status: :see_other, notice: "Booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

  def set_showtime
    @showtime = Showtime.find_by(id: params[:showtime_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to showtime_gallery_index_path, alert: "Showtime not found."
 
  end


    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:showtime_id, :number_of_tickets, :total_amount)
    end
end
