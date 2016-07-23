class DropUserIdColumnFromAvatars < ActiveRecord::Migration
  def change
    remove_column :avatars, :user_profile_id
  end
end
