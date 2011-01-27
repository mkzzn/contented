class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  validates_presence_of :title, :allow_blank => false
  validates_presence_of :body, :allow_blank => false
end
