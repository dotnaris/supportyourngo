class AddPriceToPledges < ActiveRecord::Migration[7.0]
  def change
    add_column :pledges, :price, :integer
  end
end
