class FinalTweet < ActiveRecord::Base
   attr_accessible :id, :text, :created_at, :score
   validates :score, presence: true
end
