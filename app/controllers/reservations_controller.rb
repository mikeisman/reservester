class ReservationsController < ApplicationController
  before_action :set_restaurant

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.restaurant_id = @restaurant.id
    if @reservation.save
      redirect_to @restaurant, notice: 'Reservation was successfully created.'
    else
      render 'restaurants/show'
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:name, :reservation_at)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
