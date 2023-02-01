class Laboratory < ApplicationRecord
  belongs_to :user
  has_many :products
  has_many :orders
  has_many :order_products, through: :orders
  has_many :pharmacies, through: :orders
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  before_validation { name.nil? ? false : self.name = name.strip.downcase }
  before_validation { email.nil? ? false : self.email = email.strip.downcase }

  def ten_most_profitable_products
    products.sort_by(&:lab_benefit).reverse.first(10) unless products.empty?
  end

  def three_most_profitables_pharmacies(results = [])
    orders_grouped_by_pharmacies = Order.where(laboratory: id).group_by(&:pharmacy)

    orders_grouped_by_pharmacies.each_pair do |pharmacy, orders|
      benefits = orders.sum { |order| order.order_products.sum { |order_product| order_product.product.lab_benefit * order_product.quantity } }
      results << [pharmacy, benefits]
    end
    results.sort_by { |tuple| tuple[1] }.reverse.first(3)
  end

  def three_most_profitables_cities(results = [])
    pharmacies_grouped_by_cities = Order.where(laboratory: id).group_by { |order| order.pharmacy.city }

    pharmacies_grouped_by_cities.each_pair do |city, orders|
      benefits = orders.sum { |order| order.order_products.sum { |order_product| order_product.product.lab_benefit * order_product.quantity } }
      results << [city, benefits]
    end
    results.sort_by { |tuple| tuple[1] }.reverse.first(3)
  end
end
