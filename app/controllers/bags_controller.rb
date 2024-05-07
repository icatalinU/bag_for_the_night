class BagsController < ApplicationController
  def index
    @bags = Bag.all
  end

  def show
    @bag = Bag.find(params[:id])
  end

  def new
    @bag = Bag.new
  end

  def create
    @bag = Bag.find(params[:id])
    @bag = Bag.new(bag_params)
    if @bag.save
      redirect_to bag_path(@bag), notice: "You new bag post is sucessful!!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def bag_params
    params.require(:bag).permit(:name, :brand, :price, :description, :picture_url, :condition, :location)
  end
end
