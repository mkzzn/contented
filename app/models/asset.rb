class Asset < ActiveRecord::Base
  belongs_to :article
  has_attached_file :asset, :styles => { :large => "720x480", :medium => "300x300", :small => "100x100" }
end
