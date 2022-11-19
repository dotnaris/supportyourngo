class AddColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :location, :string
    add_column :users, :is_ngo, :boolean
  end
end
