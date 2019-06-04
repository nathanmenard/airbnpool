class PoolsController < ApplicationController
  def index
    @pools = Pool.all
  end

  def show
    @pool = Pool.find(params[:id])
  end

  # def new
  #   @cocktail = Cocktail.new
  # end

  # def create
  #   @cocktail = Cocktail.new(cocktail_params)

  #   @cocktail.save

  #   if @cocktail.save
  #     # 3. Redirige vers la fiche de cocktail cree
  #     redirect_to cocktail_path(@cocktail)
  #   else
  #     render :new
  #   end
  # end

  private

  def pool_params
    params.require(:pool).permit(:title, :description, :capacity, :picture, :address, :latitude, :longitude, :heated, :daily_price, :user_id)
  end
end
