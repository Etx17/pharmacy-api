class AddEmailToPharmacy < ActiveRecord::Migration[7.0]
  def change
    add_column :pharmacies, :email, :string
  end
end
