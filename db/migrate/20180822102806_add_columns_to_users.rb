class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :description, :string
    add_column :users, :image, :string
  end
end
