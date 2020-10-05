class Api::V1::FacultiesController < Api::V1::ApiController
  before_action :set_faculty, only: [:show]
  def index
    render json: ::V1::FacultySerializer.new(Faculty.all).serialized_json
  end

  def show
    render json: ::V1::FacultySerializer.new(@faculty).serialized_json
  end

  private
  def set_faculty
    @faculty = Faculty.find_by(id: params[:id])
  end
end