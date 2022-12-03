class AddAmountToContributions < ActiveRecord::Migration[7.0]
  def change
    add_column :contributions, :amount, :integer
  end
end
