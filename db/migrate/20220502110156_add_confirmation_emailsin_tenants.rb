class AddConfirmationEmailsinTenants < ActiveRecord::Migration[6.1]
  def change
    add_column :tenants, :confirmation_token, :string
    add_column :tenants, :confirmed_at, :datetime
    add_column :tenants, :confirmation_sent_at, :datetime
  end
end
