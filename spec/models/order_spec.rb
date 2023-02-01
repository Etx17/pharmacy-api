require 'rails_helper'

RSpec.describe Order, type: :model do
  # after save it should create a sale_product for each product in the order if the pharmacy doesn't have yet the sale product
  # if the pharmacy already has the sale product, it should update the quantity

  describe 'creation' do
    let(:pharmacy) { create :pharmacy }
    let(:laboratory) { create :laboratory }
    let(:product) { create :product, laboratory: laboratory }
    let(:product_two) { create :product, laboratory: laboratory }
    let(:sale_product) { create :sale_product, product: product, pharmacy: pharmacy, stock_count: 10 }
    let(:order) do
      Order.new(laboratory: laboratory, pharmacy: pharmacy, order_products_attributes:
        [
          { product: product, quantity: 20 },
          { product: product_two, quantity: 30 }
        ])
    end

    it 'creates a new order' do
      expect { order.save }.to change { Order.count }.by(1)
    end

    it 'creates order products' do
      expect { order.save }.to change { OrderProduct.count }.by(2)
    end

    it 'associates order products with the order' do
      order.save
      expect(order.order_products.count).to eq 2
    end

    it 'is invalid if order does not have any order products' do
      order.order_products = []
      order.save
      expect(order).to_not be_valid
    end
    it 'is invalid if laboratory does not own one of the product' do
      order.order_products.last.product.update(laboratory: create(:laboratory))
      expect(order).to_not be_valid
    end

    it 'calls the increment_stock_count callback once after save' do
      allow(order).to receive(:increment_stock_count)
      order.save
      expect(order).to have_received(:increment_stock_count).once
    end
  end
end
