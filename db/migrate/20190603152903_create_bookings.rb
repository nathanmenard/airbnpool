class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :starting_date
      t.date :ending_date
      t.float :total_price
      t.string :booking_status
      t.references :user, foreign_key: true
      t.references :booking, foreign_key: true
      t.timestamps
    end
  end
end
