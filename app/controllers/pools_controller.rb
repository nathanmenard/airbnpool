class PoolsController < ApplicationController
  def index
    if params[:query].present?
      @pools = Pool.where(address: params[:query])
    else
      @pools = Pool.all
    end

    @pools = Pool.where.not(latitude: nil, longitude: nil)

    @markers = @pools.map do |pool|
      {
        lat: pool.latitude,
        lng: pool.longitude
      }

    end
  end

  def show
    @pool = Pool.find(params[:id])
    @booking = Booking.new
  end

  private

  def pool_params
    params.require(:pool).permit(:title, :description, :picture, :address, :latitude, :longitude, :heated, :capacity, :daily_price, :user_id)
  end
end
