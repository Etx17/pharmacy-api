class Product < ApplicationRecord
  belongs_to :laboratory
  has_many :order_products
  has_many :sale_products
  has_many :orders, through: :order_products
  before_validation { name.nil? ? false : name.strip }
  validates :laboratory, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 50 }
  validates :lab_selling_price, presence: true, numericality: { greater_than: 0 }
  validates :cost_of_production, presence: true, numericality: { greater_than: 0 }

  def lab_benefit
    lab_selling_price - cost_of_production
  end
end
