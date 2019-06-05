class PoolsController < ApplicationController
  def index
    @pools = Pool.all
  end

  def show
    @pool = Pool.find(params[:id])
  end

  private

  def pool_params
    params.require(:pool).permit(:title, :description, :picture, :address, :latitude, :longitude, :heated, :capacity, :daily_price, :user_id)
  end
end
