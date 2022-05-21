class RemoveDescriptionFromProperty < ActiveRecord::Migration[6.1]
  def change
    remove_column :properties, :description, :text
  end
end
