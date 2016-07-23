class ProfilePicture < ActiveRecord::Base
  belongs_to :user_profile
  belongs_to :avatar
end
