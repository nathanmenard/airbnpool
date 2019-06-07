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

  def new
    @pool = Pool.new
    @user = current_user
  end

  def create
    # 1. Construire un object Pool a partir de params[:pool]
    @pool = Pool.new(pool_params)
    @user = current_user
    @pool.user = @user
    # 2. Sauver l'objet en DB
    if @pool.save
      # 3. Redirige vers la liste des restaurants
      redirect_to pool_path(@pool)
    else
      render :new
    end
  end

  private

  def pool_params
    params.require(:pool).permit(:title, :description, :picture, :address, :city, :latitude, :longitude, :heated, :capacity, :daily_price, :user_id)
  end
end
