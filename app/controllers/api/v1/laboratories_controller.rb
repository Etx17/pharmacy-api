class Api::V1::LaboratoriesController < Api::V1::BaseController
  def index
    @laboratories = Laboratory.all
  end

  def show
    @laboratory = Laboratory.find(params[:id])
  end
end
