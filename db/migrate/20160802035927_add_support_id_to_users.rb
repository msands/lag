class AddSupportIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :support_id, :integer
  end
end
