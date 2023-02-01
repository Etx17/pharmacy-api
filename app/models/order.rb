class Order < ApplicationRecord
  belongs_to :pharmacy
  belongs_to :laboratory
  has_many :order_products
  has_many :products, through: :order_products
  accepts_nested_attributes_for :order_products

  validates :pharmacy, :laboratory, presence: true
  validates :order_products, presence: true
  validate :laboratory_owns_product

  after_save :increment_stock_count

  def laboratory_owns_product
    order_products.each do |order_product|
      if order_product.product.laboratory != laboratory
        errors.add(:order_products, "Laboratory does not own this product")
      end
    end
  end

  def increment_stock_count
    order_products.each do |order_product|
      sale_product = SaleProduct.find_by(product: order_product.product, pharmacy: pharmacy)
      if sale_product
        sale_product.update(stock_count: sale_product.stock_count + order_product.quantity)
      else
        SaleProduct.create(product: order_product.product, pharmacy: pharmacy, stock_count: order_product.quantity)
      end
    end
  end
end
