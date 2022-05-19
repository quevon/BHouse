class AddStatustoTransaction < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :status, :string, default: "Waiting for Payment"
  end
end
