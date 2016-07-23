class DropAvatarFromUserProfiles < ActiveRecord::Migration
  def change
    remove_column :user_profiles, :avatar
  end
end
