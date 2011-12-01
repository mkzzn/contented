class Asset < ActiveRecord::Base
  has_attached_file :data

  has_many :asset_links
  
  def url(*args)
    data.url(*args)
  end
  
  def file_name
    data_file_name
  end
  
  def content_type
    data_content_type
  end
  
  def file_size
    data_file_size
  end
end
