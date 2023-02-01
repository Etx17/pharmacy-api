class RemoveOrderProductFromSaleProduct < ActiveRecord::Migration[7.0]
  def change
    remove_reference :sale_products, :order_product, index: true, foreign_key: true
    add_reference :sale_products, :product, index: true
  end
end
