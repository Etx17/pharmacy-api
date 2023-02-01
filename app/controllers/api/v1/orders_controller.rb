class Api::V1::OrdersController < Api::V1::BaseController
  def index
    @orders = @orders.all
    render json: @orders
  end

  def create
    @order = Order.new(order_params)
    if @order.save
        render json: @order, status: :created
    else
        render json: @order.errors, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:laboratory_id, :pharmacy_id, order_products_attributes: [:id, :product_id, :quantity])
  end

  # requête API POST: http://localhost:3000/api/v1/orders
  # {
  #   "order":{
  #       "pharmacy_id": "2",
  #       "laboratory_id": "1",
  #       "order_products_attributes": [
  #           {
  #               "product_id": "1",
  #               "quantity": "8"
  #           },
  #           {
  #               "product_id": "1",
  #               "quantity": "4"
  #           }
  #       ]
  #   }
  # }
end
