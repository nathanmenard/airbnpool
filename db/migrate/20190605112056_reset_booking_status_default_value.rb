class ResetBookingStatusDefaultValue < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :booking_status, :string, default: 'pending'
  end
end
