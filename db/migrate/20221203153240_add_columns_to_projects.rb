class AddColumnsToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :description, :string
    add_column :projects, :paragraph_title, :string
  end
end
