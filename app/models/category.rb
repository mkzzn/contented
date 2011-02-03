class Category < ActiveRecord::Base
  # associations
  has_many :articles

  # validations
  validates :title, :presence => true
end
