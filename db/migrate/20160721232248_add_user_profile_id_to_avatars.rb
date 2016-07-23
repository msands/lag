class AddUserProfileIdToAvatars < ActiveRecord::Migration
  def change
    add_column :avatars, :user_profile_id, :integer
  end
end
