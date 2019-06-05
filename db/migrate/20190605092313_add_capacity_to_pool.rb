class AddCapacityToPool < ActiveRecord::Migration[5.2]
  def change
    add_column :pools, :capacity, :integer
  end
end
