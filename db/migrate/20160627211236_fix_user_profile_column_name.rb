class FixUserProfileColumnName < ActiveRecord::Migration
  def change
    rename_column :user_profiles, :userid, :user_id
  end
end
