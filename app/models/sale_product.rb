class SaleProduct < ApplicationRecord
  belongs_to :pharmacy
  belongs_to :product
  has_many :sales

  validates :pharmacy, :product, :stock_count, presence: true
  validates :stock_count, numericality: { only_integer: true, greater_than: 0 }
  # validates :selling_price, numericality: { greater_than: 0 }
  validates :product_id, uniqueness: { scope: :pharmacy_id }
end
