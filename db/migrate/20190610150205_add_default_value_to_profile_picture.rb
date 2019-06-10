class AddDefaultValueToProfilePicture < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :profile_picture, "https://pngimage.net/wp-content/uploads/2018/05/default-user-profile-image-png-2.png"
  end
end
