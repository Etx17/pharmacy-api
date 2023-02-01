class Sale < ApplicationRecord
  belongs_to :sale_product
  validates :sale_product, :quantity, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
  validate :quantity_is_less_than_or_equal_to_stock_count

  after_save :decrement_stock_count

  private

  def quantity_is_less_than_or_equal_to_stock_count
    quantity.to_i > sale_product.stock_count ? errors.add(:quantity, "can't be greater than stock count") : true
  end

  def decrement_stock_count
    sale_product.update(stock_count: sale_product.stock_count - quantity.to_i)
    # We will handle email here if stock count is reaching 5 or below
  end
end
