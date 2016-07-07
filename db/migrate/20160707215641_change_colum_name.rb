class ChangeColumName < ActiveRecord::Migration
  def change
    rename_column :topics, :description, :message
    rename_column :topics, :name, :title
  end
end
