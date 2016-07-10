class AddSlugsForPrettyLinks < ActiveRecord::Migration
  def change
    add_column :forums, :slug, :string
    add_index :forums, :slug
    add_column :topics, :slug, :string
    add_index :topics, :slug
  end
end
