class FixUserReferenceOnPools < ActiveRecord::Migration[5.2]
  def change
    remove_reference :pools, :users, index: true, foreign_key: true
    add_reference :pools, :user, index: true, foreign_key: true
  end
end
