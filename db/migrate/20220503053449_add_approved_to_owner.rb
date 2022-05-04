class AddApprovedToOwner < ActiveRecord::Migration[6.1]
  def self.up
    add_column :owners, :approved, :boolean, :default => false, :null => false
    add_index  :owners, :approved
  end

  def self.down
    remove_index  :owners, :approved
    remove_column :owners, :approved
  end
end
