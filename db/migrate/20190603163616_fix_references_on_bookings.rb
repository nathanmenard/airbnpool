class FixReferencesOnBookings < ActiveRecord::Migration[5.2]
  def change
    remove_reference :bookings, :booking, index: true, foreign_key: true
    add_reference :bookings, :pool, index: true, foreign_key: true
  end
end
