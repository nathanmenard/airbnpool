class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    # we need `pool_id` to asssociate booking with corresponding pool
    @pool = Pool.find(params[:pool_id])
    @booking.pool = @pool

    if @booking.save
      redirect_to pool_path(@pool)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:starting_date, :ending_date)
  end
end
