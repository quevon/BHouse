class AddBalancetoTenantandOwner < ActiveRecord::Migration[6.1]
  def change
    add_column :tenants, :balance, :decimal, precision: 10, scale: 2, default: 5000
    add_column :owners, :balance, :decimal, precision: 10, scale: 2, default: 5000
  end
end
