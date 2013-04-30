class Tweet < ActiveRecord::Base
  attr_accessible :text

  # Access IPAddress attributes
  attr_accessible :ip_address_attributes

  # Add a text limit of 140
  # This is not to be confused with the limit I added in ActiveRecord
  validates :text, presence: true, length: { maximum: 140 }

  acts_as_votable
end
