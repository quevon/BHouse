class Add < ActiveRecord::Migration[6.1]
  def change
    add_column :tenants, :image_data, :text
  end
end
