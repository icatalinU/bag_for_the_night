class PagesController < ApplicationController
  def profile
    @user = params[:current_user]
    @bags = Bag.where(:user_id == @user_id)
  end

  def show
    @bags = Bag.all
  end
end
