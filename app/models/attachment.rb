class Attachment < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true
  mount_uploader :asset, AssetUploader

  Attachment.before_destroy :remove_files

  def store_dir
    "public/uploads/attachment/asset/#{id}"
  end

  def remove_files
    require 'fileutils'
    FileUtils.rm_rf store_dir
  end
end
