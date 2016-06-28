class UserProfile < ActiveRecord::Base

  INTERESTS = ["Gaming", "Photo Editing", "Web Design/Development", "Servers", "Computer Repair"]

  belongs_to :user

  acts_as_birthday :birthday

  delegate :email, to: :user
end
