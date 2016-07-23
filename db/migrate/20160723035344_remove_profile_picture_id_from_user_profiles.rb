class RemoveProfilePictureIdFromUserProfiles < ActiveRecord::Migration
  def change
    remove_column :user_profiles, :profile_picture_id
  end
end
