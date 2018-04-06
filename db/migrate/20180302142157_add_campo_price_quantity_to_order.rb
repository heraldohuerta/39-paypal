class AddCampoPriceQuantityToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :price, :float
    add_column :orders, :quantity, :integer
  end
end
