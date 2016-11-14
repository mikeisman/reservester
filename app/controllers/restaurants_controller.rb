class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy, :star]

  before_action :authenticate_user!, except: [:index, :show]

  # GET /restaurants
  def index
    @restaurants = Restaurant.all
  end

  # GET /restaurants/1
  def show
    @reservation = Reservation.new
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  def create
    @restaurant = Restaurant.new(restaurant_params)

    @restaurant.user = current_user

    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /restaurants/1
  def update
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant, notice: 'Restaurant was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /restaurants/1
  def destroy
    @restaurant.destroy
    redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.'
  end

  def owner_dashboard
  end

  def patron_dashboard
  end

  def star
    if current_user.starred_restaurants.include?(@restaurant)
      current_user.starred_restaurants.delete(@restaurant)
      @message = "Unstarred #{@restaurant.name}"
    else
      current_user.starred_restaurants << @restaurant
      @message = "You starred #{@restaurant.name}"
    end
    respond_to do |format|
      format.html { redirect_to :back, notice: @message }
      format.js {}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :address)
    end
end
