class CreateAttachments < ActiveRecord::Migration
  def self.up
    create_table :attachments do |t|
      t.text :description
      t.string :title
      t.string :asset
      t.string :attachable_type
      t.integer :attachable_id

      t.timestamps
    end
  end

  def self.down
    drop_table :attachments
  end
end
