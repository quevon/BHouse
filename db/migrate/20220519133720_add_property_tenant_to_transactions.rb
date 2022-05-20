class AddPropertyTenantToTransactions < ActiveRecord::Migration[6.1]
    def change
      add_reference :transactions, :property_tenant, null: false, foreign_key: true
    end
  end