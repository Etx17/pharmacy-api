class AddUniqueIndexToSaleProducts < ActiveRecord::Migration[7.0]
  def change
    add_index :sale_products, [:product_id, :pharmacy_id], unique: true
  end
end
