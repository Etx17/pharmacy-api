class Api::V1::PharmaciesController < Api::V1::BaseController
  def index
    @pharmacies = params[:city].present? ? Pharmacy.where(city: params[:city]) : Pharmacy.all
    render json: @pharmacies
    # http://localhost:3000/api/v1/pharmacies?city=Paris
  end
end
