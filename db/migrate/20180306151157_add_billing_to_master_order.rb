class AddBillingToMasterOrder < ActiveRecord::Migration[5.1]
  def change
    add_reference :master_orders, :billing, foreign_key: true
  end
end
