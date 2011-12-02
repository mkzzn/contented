class Attachment < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true
  mount_uploader :asset, AssetUploader

  def store_dir
    "uploads/attachment/asset"
  end

  def before_destroy
    remove_asset!
  end
end
