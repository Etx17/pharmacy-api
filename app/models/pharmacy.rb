class Pharmacy < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_many :order_products, through: :orders
  has_many :products, through: :order_products
  has_many :sale_products
  has_many :sales, through: :sale_products

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :city, presence: true

  # Trim whites spaces on creation
  before_validation { self.name = name.strip }

end
