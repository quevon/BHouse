class AddDescriptionToProperty < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :description, :text
  end
end
