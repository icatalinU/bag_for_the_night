class BagsController < ApplicationController
  def index
    if params[:query].present?
      @bags = Bag.search_by_name_and_description(params[:query])
    else
      @bags = Bag.all
    end

    # @bags = Bag.all
    @users = User.all
    # The `geocoded` scope filters only users with coordinates
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end
  end

  def show
    @bag = Bag.find(params[:id])
  end

  def new
    @bag = Bag.new
    @conditions = Bag::CONDITIONS
  end

  def create
    @bag = Bag.new(bag_params)
    @bag.user = current_user
    if @bag.save
      redirect_to bag_path(@bag), notice: "Your new bag post is sucessful!!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @bag = Bag.find(params[:id])
  end

  def update
    @bag = Bag.find(params[:id])
    @bag.update(bag_params)
    redirect_to bag_path(@bag)
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
