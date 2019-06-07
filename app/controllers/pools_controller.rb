class PoolsController < ApplicationController
  def index
    if params[:query].present?
      @pools = Pool.where(city: params[:query])
    end

    @pools = Pool.all if @pools.nil? || @pools.empty?

    @markers = @pools.map do |pool|
      {
        lat: pool.latitude,
        lng: pool.longitude,
        # infoWindow: render_to_string(partial: "infowindow", locals: { pool: pool })
      }
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
