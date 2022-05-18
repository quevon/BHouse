class AddSlotsToProperties < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :slots, :integer
  end
end
