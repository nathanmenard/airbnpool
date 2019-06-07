class PoolsController < ApplicationController
  def index
    if params[:query].present?
      @pools = Pool.where(city: params[:query])
    end

  @pools = Pool.all if @pools.nil? || @pools.empty?

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
