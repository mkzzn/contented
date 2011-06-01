class AddRoleToUser < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.string :role, :default => "reader"
    end
  end

  def self.down
    remove_column :users, :role
  end
end
