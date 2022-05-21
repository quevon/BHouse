class ChangeDescription < ActiveRecord::Migration[6.1]
  def change
    change_column :properties, :description, :text
  end
end
