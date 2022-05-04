class Addfullnametotenant < ActiveRecord::Migration[6.1]
  def change
    add_column :tenants, :firstname, :string
    add_column :tenants, :middlename, :string
    add_column :tenants, :lastname, :string
  end
end
