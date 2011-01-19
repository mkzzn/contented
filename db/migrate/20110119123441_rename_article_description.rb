class RenameArticleDescription < ActiveRecord::Migration
  def self.up
    rename_column :articles, :description, :body
  end

  def self.down
    rename_column :articles, :body, :description
  end
end
