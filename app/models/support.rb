class Support < ActiveRecord::Base
  SUBJECT = [
    "I have a suggestion for the website.",
    "I would like to change my username.",
    "I would like to report a page or user.",
    "Can you please create a new forum?",
    "Other..."
  ]

  validates :subject, :presence => true
  validates :message, :presence => true
end
