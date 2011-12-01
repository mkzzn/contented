class CreateAssetLinks < ActiveRecord::Migration
  def self.up
    create_table :asset_links do |t|
      t.integer :attachable_id
      t.string :attachable_type
      t.integer :asset_id

      t.timestamps
    end
  end

  def self.down
    drop_table :asset_links
  end
end
