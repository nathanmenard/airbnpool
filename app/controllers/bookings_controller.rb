class BookingsController < ApplicationController
  before_action :authenticate_user!
  def create
    @booking = Booking.new(booking_params)
    # we need `pool_id` to asssociate booking with corresponding pool
    @pool = Pool.find(params[:pool_id])
    @booking.pool = @pool

    if @booking.save
      redirect_to pool_path(@pool)
    else
      render 'pools/show'
    end
  end

  def index
    @next_ploofs = []
    @past_ploofs = []

    current_user.bookings.each do |booking|
      if DateTime.now.to_date < booking.starting_date
        @next_ploofs << booking
      else
        @past_ploofs << booking
      end
    end
  end

  #def calcul total_price

  private

  def booking_params
    params.require(:booking).permit(:starting_date, :ending_date)
  end
end
