class CreateSupports < ActiveRecord::Migration
  def change
    create_table :supports do |t|
      t.string :subject
      t.text :message
      t.string :username

      t.timestamps null: false
    end
  end
end
