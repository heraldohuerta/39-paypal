class AddCampoTotalToMasterOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :master_orders, :total, :float
  end
end
