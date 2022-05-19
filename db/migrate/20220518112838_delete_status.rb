class DeleteStatus < ActiveRecord::Migration[6.1]
  remove_column :tenants, :status
  remove_column :transactions, :status
end
