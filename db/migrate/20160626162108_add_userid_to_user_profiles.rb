class AddUseridToUserProfiles < ActiveRecord::Migration
  def change
    add_column :user_profiles, :userid, :integer
  end
end
