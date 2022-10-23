class CreateOrderingProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :ordering_products do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :price
      t.integer :amount
      t.integer :making_status, default: 0

      t.timestamps
    end
  end
end
