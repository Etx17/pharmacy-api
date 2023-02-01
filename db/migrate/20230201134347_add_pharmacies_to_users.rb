class AddPharmaciesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :pharmacy, foreign_key: true, index: true
    add_reference :users, :laboratory, foreign_key: true, index: true
  end
end
