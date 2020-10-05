class Api::V1::LecturersController < Api::V1::ApiController
  before_action :set_lecturer, only: [:show]
  def index
    render json: ::V1::LecturerSerializer.new(Lecturer.all).serialized_json
  end

  def show
    render json: ::V1::LecturerSerializer.new(@lecturer).serialized_json
  end

  private
    def set_lecturer
      @lecturer = Lecturer.find_by(id: params[:id])
    end
end