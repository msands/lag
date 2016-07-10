class Topic < ActiveRecord::Base
  belongs_to :user
  belongs_to :forum

  #extend FriendlyId
  #friendly_id :title, use: :slugged

end
