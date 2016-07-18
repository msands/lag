class Forum < ActiveRecord::Base
  belongs_to :user
  has_many :topics

  #extend FriendlyId
  #friendly_id :name, use: :slugged

end
