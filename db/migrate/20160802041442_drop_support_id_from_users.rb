class DropSupportIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :support_id
  end
end
