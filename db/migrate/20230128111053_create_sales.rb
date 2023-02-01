class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.references :sale_product, null: false, foreign_key: true
      t.string :quantity

      t.timestamps
    end
  end
end
