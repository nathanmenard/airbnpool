class CreatePools < ActiveRecord::Migration[5.2]
  def change
    create_table :pools do |t|
      t.integer :daily_price
      t.string :title
      t.text :description
      t.string :picture
      t.string :address
      t.float :latitude
      t.float :longitude
      t.boolean :heated
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
