class Api::V1::UniversityGroupsController < Api::V1::ApiController
  before_action :set_university_group, only: [:show]
  def index
    render json: ::V1::UniversityGroupSerializer.new(UniversityGroup.all).serialized_json
  end

  def show
    render json: ::V1::UniversityGroupSerializer.new(@university_group).serialized_json
  end

  private
  def set_university_group
    @university_group = UniversityGroup.find_by(id: params[:id])
  end
end