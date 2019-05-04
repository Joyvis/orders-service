class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :cellphone_model, null: false
      t.string :cellphone_imei, null: false
      t.float :annual_price, null: false
      t.integer :installments, default: 1
      t.timestamps
    end
  end
end
