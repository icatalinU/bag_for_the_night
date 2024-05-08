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
    @bag = Bag.new(bag_params)
    @bag.user = current_user
    if @bag.save
      redirect_to bag_path(@bag), notice: "Your new bag post is sucessful!!"
    else
      render :new, status: :unprocessable_entity
    end

    def edit
      @bag = Bag.find(params[:id])
      @bag.user = current_user
      raise
    end

    def update
      @bag = Bag.find(params[:id])
      @bag.update(bag_params)
      redirect_to bag_path(@bag)
    end
  end
  def destroy
    @bag = Bag.find(params[:id])
    @bag.destroy
    redirect_to profile_path(current_user), status: :see_other
  end
  private
  def bag_params
    params.require(:bag).permit(:name, :brand, :price, :description, :picture_url, :condition, :location, photos: [])
  end
end
