class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.string :church
      t.string :state
      t.string :website
      t.string :interests, array: true
      t.date :birthday
      t.string :gender

      t.timestamps null: false
    end
  end
end
