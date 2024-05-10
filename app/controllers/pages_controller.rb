class PagesController < ApplicationController
  def home
  end

  def profile
    @user = current_user
    @bags = @user.bags
    @bookings = @user.bookings
  end
end
