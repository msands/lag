class Topic < ActiveRecord::Base
  belongs_to :user
  belongs_to :forum
  has_many :comments

  #extend FriendlyId
  #friendly_id :title, use: :slugged

end
