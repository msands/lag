class UserProfile < ActiveRecord::Base

  GENDER = ["Boy", "Girl"]
  INTERESTS = ["Gaming", "Photo Editing", "Web Design/Development", "Servers", "Computer Repair"]

  belongs_to :user
  has_one :avatar#, through: :profile_picture
  #has_one :profile_picture

  acts_as_birthday :birthday

  delegate :email, to: :user
end
