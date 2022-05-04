class Addunconfirmed < ActiveRecord::Migration[6.1]
  def change
    add_column :tenants, :unconfirmed_email, :string
  end
end
