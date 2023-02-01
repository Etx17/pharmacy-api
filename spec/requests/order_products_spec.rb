require 'rails_helper'

RSpec.describe "OrderProducts", type: :request do
  describe "GET /order_products" do
    it "works! (now write some real specs)" do
      get order_products_path
      expect(response).to have_http_status(200)
    end
  end
end
