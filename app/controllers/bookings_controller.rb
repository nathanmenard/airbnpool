class BookingsController < ApplicationController
  before_action :authenticate_user!
  def create
    @booking = current_user.bookings.new(booking_params)
    # we need `pool_id` to asssociate booking with corresponding pool
    @pool = Pool.find(params[:pool_id])
    @booking.pool = @pool
    @booking.total_price = (@booking.ending_date - @booking.starting_date + 1) * @pool.daily_price

    if @booking.save
      flash[:notice] = "Booking request has been sent! Thank you!"
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
    @booking_enquiries = Booking.joins(:pool).where("pools.user_id = ?", current_user)
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.update(booking_status: 'accepted')

    if @booking.booking_status == 'accepted'
      flash[:success] = 'Booking has been accepted'
      redirect_to bookings_path
    else
      flash[:error] = 'Oops! Something went wrong...'
      redirect_to bookings_path
   end
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.update(booking_status: 'declined')

    if @booking.booking_status == 'declined'
      flash[:success] = 'Booking has been declined'
      render 'bookings/index'
    else
      flash[:error] = 'Oops! Something went wrong...'
      render 'bookings/index'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:starting_date, :ending_date)
  end
end
