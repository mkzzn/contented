class Article < ActiveRecord::Base
  # associations
  has_many :comments, :dependent => :destroy
  belongs_to :category

  # validations
  validates_presence_of :title, :allow_blank => false
  validates_presence_of :body, :allow_blank => false
end
