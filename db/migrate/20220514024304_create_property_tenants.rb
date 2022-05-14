class CreatePropertyTenants < ActiveRecord::Migration[6.1]
  def change
    create_table :property_tenants do |t|
      t.references :property, null: false, foreign_key: true
      t.references :tenant, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
