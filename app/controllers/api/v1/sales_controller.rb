class Api::V1::SalesController < Api::V1::BaseController

  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      render json: @sale, status: :created
    else
      render json: @sale.errors, status: :unprocessable_entity
    end
  end

  private

  def sale_params
    params.require(:sale).permit(:quantity, :sale_product_id )
  end
end

