class CreateMasterOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :master_orders do |t|
      t.boolean :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
