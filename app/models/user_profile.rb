class UserProfile < ActiveRecord::Base

  GENDER = ["Boy", "Girl"]
  INTERESTS = ["Gaming", "Photo Editing", "Web Design/Development", "Servers", "Computer Repair"]

  belongs_to :user
  belongs_to :avatar

  acts_as_birthday :birthday

  delegate :email, to: :user
end
