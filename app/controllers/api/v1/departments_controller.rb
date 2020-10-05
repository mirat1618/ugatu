class Api::V1::DepartmentsController < Api::V1::ApiController
  before_action :set_department, only: [:show]
  def index
    render json: ::V1::DepartmentSerializer.new(Department.all).serialized_json
  end

  def show
    render json: ::V1::DepartmentSerializer.new(@department).serialized_json
  end

  private
  def set_department
    @department = Department.find_by(id: params[:id])
  end
end