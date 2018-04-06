class AddMasterOrderToOrder < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :master_order, foreign_key: true
  end
end
