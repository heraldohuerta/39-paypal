class CreateBillings < ActiveRecord::Migration[5.1]
  def change
    create_table :billings do |t|
      t.string :code
      t.string :payment_method
      t.decimal :amount, precision: 5, scale: 2
      t.string :currency

      t.timestamps
    end
  end
end
