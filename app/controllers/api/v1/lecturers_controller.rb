class Api::V1::LecturersController < Api::V1::ApiController
  def index
    render json: ::V1::LecturerSerializer.new(Lecturer.all).serialized_json
  end
end