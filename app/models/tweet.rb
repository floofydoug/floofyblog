class Tweet < ActiveRecord::Base
  attr_accessible :text

  # Add a text limit of 140
  # This is not to be confused with the limit I added in ActiveRecord
  validates :text, presence: true, length: { maximum: 140 }
end
