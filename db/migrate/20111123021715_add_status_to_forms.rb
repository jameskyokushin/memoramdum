class AddStatusToForms < ActiveRecord::Migration
  def self.up
    add_column :forms, :status, :string
  end

  def self.down
    remove_column :forms, :status
  end
end
