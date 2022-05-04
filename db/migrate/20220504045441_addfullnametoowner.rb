class Addfullnametoowner < ActiveRecord::Migration[6.1]
  def change
    add_column :owners, :firstname, :string
    add_column :owners, :middlename, :string
    add_column :owners, :lastname, :string
  end
end
