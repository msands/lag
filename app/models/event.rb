class Event < ActiveRecord::Base

  DRESS_CODE = ["None", "Comfortable", "Casual", "Professional"]
  FOOD_PROVIDED = ["Yes", "No"]

  belongs_to :user
end
