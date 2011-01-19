class RenameCommentBody < ActiveRecord::Migration
  def self.up
    rename_column :comments, :comment, :body
  end

  def self.down
    rename_column :comments, :body, :comment
  end
end
