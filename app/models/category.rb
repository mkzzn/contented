class Category < ActiveRecord::Base
  validates :title, :presence => true
end
