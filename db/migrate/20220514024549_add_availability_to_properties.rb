class AddAvailabilityToProperties < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :availability, :boolean
  end
end
