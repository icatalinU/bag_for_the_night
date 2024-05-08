class PagesController < ApplicationController
  def profile
    @user = params[:current_user]
    @bags = Bag.where(@user_id == :user_id)
    @bookings = Booking.where(@user == :user_id)
  end
end
