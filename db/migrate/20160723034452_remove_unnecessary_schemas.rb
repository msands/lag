class RemoveUnnecessarySchemas < ActiveRecord::Migration
  def change
    drop_table :profile_pictures
    remove_column :avatars, :profile_picture_id
  end
end
