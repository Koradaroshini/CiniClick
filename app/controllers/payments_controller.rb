class PaymentsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
  end

  def create
    @booking = Booking.find(params[:booking_id])

 
   if params[:credit_card_number].present?
    # Update seat count after successful payment
    @booking.update_seat_count!

    # Redirect to the ticket page
    redirect_to ticket_path(@booking.id), notice: "Payment Successful!"
   else
    redirect_to new_payment_path(booking_id: @booking.id), alert: "Payment failed. Please try again."
   end
  end
end