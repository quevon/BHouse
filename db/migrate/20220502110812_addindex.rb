class Addindex < ActiveRecord::Migration[6.1]
  def change
       add_index :tenants, :confirmation_token,   unique: true
  end
end
