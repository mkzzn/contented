class AddTeaserToArticle < ActiveRecord::Migration
  def self.up
    add_column :articles, :teaser, :text
  end

  def self.down
    remove_column :articles, :teaser
  end
end
