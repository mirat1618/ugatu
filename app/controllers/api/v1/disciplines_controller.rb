class Api::V1::DisciplinesController < Api::V1::ApiController
  before_action :set_discipline, only: [:show]
  def index
    render json: ::V1::DisciplineSerializer.new(Discipline.all).serialized_json
  end

  def show
    render json: ::V1::DisciplineSerializer.new(@discipline).serialized_json
  end

  private
  def set_discipline
    @discipline = Discipline.find_by(id: params[:id])
  end
end