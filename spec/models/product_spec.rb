require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "product creation" do
    let(:product) { create :product }
    it "is valid with valid attributes" do
      expect(product).to be_valid
    end

    it "increments the product count by 1" do
      expect { create :product }.to change { Product.count }.by(1)
    end

    it "is invalid without a name" do
      empty_name_product = Product.create(name: nil, laboratory_id: 1, lab_selling_price: 100, cost_of_production: 50)
      expect(empty_name_product).to_not be_valid
    end

    it "is invalid without a laboratory_id" do
      empty_lab_product = Product.create(name: Faker::Commerce.product_name, laboratory_id: nil, lab_selling_price: 100, cost_of_production: 50)
      expect(empty_lab_product).to_not be_valid
    end

    it "is invalid without a lab_selling_price" do
      empty_price_product = Product.create(name: Faker::Commerce.product_name, laboratory_id: 1, lab_selling_price: nil, cost_of_production: 50)
      expect(empty_price_product).to_not be_valid
    end

    it "is invalid without a cost_of_production" do
      empty_cost_product = Product.create(name: Faker::Commerce.product_name, laboratory_id: 1, lab_selling_price: 100, cost_of_production: nil)
      expect(empty_cost_product).to_not be_valid
    end

    it "is invalid if name already exists" do
      product_duplicate = Product.create(name: product.name, laboratory_id: 1, lab_selling_price: 100, cost_of_production: 50)
      expect(product_duplicate).to_not be_valid
    end

    it "is invalid if same name with white spaces around" do
      product_duplicate = Product.create(name: " #{product.name} ", laboratory_id: 1, lab_selling_price: 100, cost_of_production: 50)
      expect(product_duplicate).to_not be_valid
    end

    it "is invalid if same name with different case" do
      product_duplicate = Product.create(name: product.name.upcase, laboratory_id: 1, lab_selling_price: 100, cost_of_production: 50)
      expect(product_duplicate).to_not be_valid
    end
  end
end
