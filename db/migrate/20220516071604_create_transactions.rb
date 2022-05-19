class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.references :tenant, null: false, foreign_key: true
      t.references :owner, null: false, foreign_key: true
      t.decimal :amount

      t.timestamps
    end
  end
end
