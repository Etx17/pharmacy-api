class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.references :laboratory, null: false, foreign_key: true
      t.integer :lab_selling_price
      t.integer :cost_of_production

      t.timestamps
    end
  end
end
