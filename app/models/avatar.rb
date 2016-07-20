class Avatar < ActiveRecord::Base
  has_one :profile_picture
  belongs_to :profile_picture
end
