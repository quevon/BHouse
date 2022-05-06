class RemoveImagesFromProperties < ActiveRecord::Migration[6.1]
  def change
    remove_column :properties, :images, :string
  end
end
