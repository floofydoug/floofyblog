class Article < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  has_many :taggings, :dependent => :destroy
    attr_accessible :title, :body, :name, :tag_list
  acts_as_taggable
end