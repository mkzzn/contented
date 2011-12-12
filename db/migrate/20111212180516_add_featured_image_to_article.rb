class AddFeaturedImageToArticle < ActiveRecord::Migration
  def self.up
    add_column :articles, :featured_image, :integer
  end

  def self.down
    add_column :articles, :featured_image
  end
end
