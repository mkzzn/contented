class AssetLink < ActiveRecord::Base
  belongs_to :asset
  belongs_to :attachable, :polymorphic => true
end
