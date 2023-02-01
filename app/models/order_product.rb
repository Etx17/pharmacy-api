class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product
  has_one :laboratory, through: :product
  has_one :pharmacy, through: :order

  validates_associated :order
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }

end
