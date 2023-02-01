require 'rails_helper'

RSpec.describe OrderProduct, type: :model do
  let(:pharmacy) { create :pharmacy }
  let(:laboratory) { create :laboratory }
  let(:product) { create :product, laboratory: laboratory }
  let(:order) {Order.new(laboratory: laboratory, pharmacy: pharmacy, order_products_attributes: [{ product: product, quantity: 20 }])}

  describe 'validation' do
    it 'is not valid if not associated to an order' do
      order_product = OrderProduct.new(product: product, quantity: 20)
      expect(order_product).to_not be_valid
    end

    it 'is valid if created through an order' do
      order.save
      expect(order.order_products.first).to be_valid
    end

    it 'is invalid if the quantity is not greater than 0' do
      order.order_products.first.quantity = 0
      expect(order).to_not be_valid
    end
  end
end
