class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.string :property_type
      t.string :listing_type
      t.string :accomodation_type
      t.string :amenities
      t.decimal :monthly_price
      t.integer :deposit_advance
      t.integer :deposit_security
      t.string :other_fees
      t.string :house_rules
      t.string :location_city
      t.float :location_lat
      t.float :location_lng
      t.string :images

      t.timestamps
    end
  end
end
