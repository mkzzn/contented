class Category < ActiveRecord::Base
  validate :title, :presence => true
end
