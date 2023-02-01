class AddEmailToLaboratories < ActiveRecord::Migration[7.0]
  def change
    add_column :laboratories, :email, :string
  end
end
