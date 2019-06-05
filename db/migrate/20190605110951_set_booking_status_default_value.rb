class SetBookingStatusDefaultValue < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :booking_status, :string, default: 'Pending'
  end
end


