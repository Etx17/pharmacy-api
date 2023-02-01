class CreateSaleProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :sale_products do |t|
      t.references :pharmacy, null: false, foreign_key: true
      t.integer :stock_count
      t.integer :selling_price
      t.references :order_product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
