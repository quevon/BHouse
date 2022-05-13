class ChangeAddressToLongAddress < ActiveRecord::Migration[6.1]
  def change
    remove_column :properties, :address
    add_column :properties, :long_address, :text
  end
end
