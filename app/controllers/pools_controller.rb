class PoolsController < ApplicationController
  def index
   @pools = Pool.where.not(latitude: nil, longitude: nil)
   @pools = Pool.where(city: params[:query])

   @markers = @pools.map do |pool|
     {
       lat: pool.latitude,
       lng: pool.longitude
     }

   end

    if params[:query].present?
      @pools = Pool.where(city: params[:query])

    else
      @pools = Pool.all
      @markers = @pools.map do |pool|
        {
          lat: pool.latitude,
          lng: pool.longitude
        }

      end
    end

  end

  def show
    @pool = Pool.find(params[:id])
    @booking = Booking.new
  end

  private

  def pool_params
    params.require(:pool).permit(:title, :description, :picture, :address, :city, :latitude, :longitude, :heated, :capacity, :daily_price, :user_id)
  end
end
