class Asset < ActiveRecord::Base
  has_attached_file :data

  belongs_to :attachable, :polymorphic => true
  validate :validate_attachment_size
  
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
