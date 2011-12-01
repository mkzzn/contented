class Asset < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  belongs_to :attachable, :polymorphic => true
  mount_uploader :asset, AssetUploader

  def to_jq_upload
    {
      "name" => read_attribute(:asset),
      "size" => asset.size,
      "url" => asset.url,
      "thumbnail_url" => asset.thumb.url,
      "delete_url" => asset_path(:id => id),
      "delete_type" => "DELETE" 
    }
  end
end
