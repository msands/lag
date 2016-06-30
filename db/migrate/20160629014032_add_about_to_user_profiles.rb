class AddAboutToUserProfiles < ActiveRecord::Migration
  def change
    add_column :user_profiles, :about, :text
  end
end
