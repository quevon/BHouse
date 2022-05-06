class RenameImagesToImageData < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :image_data, :text
  end
end
