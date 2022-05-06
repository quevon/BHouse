class Addimagefieldtoowner < ActiveRecord::Migration[6.1]
  def change
    add_column :owners, :image_data, :text
  end
end
