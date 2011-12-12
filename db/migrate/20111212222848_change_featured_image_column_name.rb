class ChangeFeaturedImageColumnName < ActiveRecord::Migration
  def self.up
    rename_column :articles, :featured_image, :featured_image_id
  end

  def self.down
    rename_column :articles, :featured_image_id, :featured_image
  end
end
