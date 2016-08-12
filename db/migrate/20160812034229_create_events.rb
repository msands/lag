class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.date :date
      t.time :time_start
      t.time :time_end
      t.string :address
      t.string :state
      t.integer :zip_code
      t.string :event_organizer
      t.string :dress_code
      t.integer :price
      t.string :food_provided
      t.text :notes
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
