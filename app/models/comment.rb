class Comment < ActiveRecord::Base
  attr_accessible :article_id, :body, :name

  belongs_to :article

  validates_presence_of :name, :body
end
