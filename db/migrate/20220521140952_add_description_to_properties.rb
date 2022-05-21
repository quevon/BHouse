class AddDescriptionToProperties < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :description, :text, :default => "Check out this property!"
  end
end
