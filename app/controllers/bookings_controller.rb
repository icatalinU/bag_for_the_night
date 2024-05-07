class BookingsController < ApplicationController
  def index
    @user = params[:current_user]
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    @bag = Bag.find(params[:bag_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @bag = Bag.find(params[:bag_id])
    @booking.bag = @bag
    @booking.user = current_user
    if @booking.save
    redirect_to profile_path(current_user), notice: "Your request has been sent!  Awaiting confirmation."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:booking_start, :booking_end, :comment)
  end
end
