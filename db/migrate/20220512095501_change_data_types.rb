class ChangeDataTypes < ActiveRecord::Migration[6.1]
  def change
    change_column :properties, :location_lat, :decimal 
    change_column :properties, :location_lng, :decimal 
    add_column :properties, :address, :string
  end
end
