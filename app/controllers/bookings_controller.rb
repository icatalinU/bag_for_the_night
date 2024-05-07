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
    @booking.save
    redirect_to bag_path(@bag)
  end

  def destroy
  end

  private

  def booking_params
    params.require(:bag).permit(:booking_start, :booking_end)
  end
end
