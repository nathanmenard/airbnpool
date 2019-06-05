class Pool < ApplicationRecord
  belongs_to :user

  has_many :bookings

  mount_uploader :picture, PhotoUploader

  add_column :pools, :capacity, :integer
end
