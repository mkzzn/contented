class Article < ActiveRecord::Base
  has_many :comments
  validates_presence_of :title, :allow_blank => false
  validates_presence_of :body, :allow_blank => false
end
