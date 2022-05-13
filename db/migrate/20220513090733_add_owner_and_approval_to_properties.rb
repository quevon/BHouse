class AddOwnerAndApprovalToProperties < ActiveRecord::Migration[6.1]
  def change
    add_reference :properties, :owner, foreign_key: true
    add_column :properties, :approved, :boolean
  end
end
