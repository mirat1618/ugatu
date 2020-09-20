class SiteController < ApplicationController
  def get_next_html_select
    type = params[:type]

    case type
    when 'faculty'
      faculty = Faculty.find(params[:id])
      @partial_response = ApplicationController.render partial: 'site/departments_options', locals: { faculty: faculty }
      @partial_layer = '#departmentsOptions'
    when 'department'
      department = Department.find(params[:id])
      @partial_response = ApplicationController.render partial: 'site/university_groups_options', locals: { department: department }
      @partial_layer = '#universityGroupsOptions'
    when 'university_group'
      university_group = UniversityGroup.find(params[:id])
      lecturers_count = university_group.lecturers.count
      @partial_response = ApplicationController.render partial: 'site/start_button', locals: { university_group: university_group, lecturers_count: lecturers_count }
      @partial_layer = '#startButton'
    else
      @partial_response = 'Не найдено шаблона для отображения'
    end

    respond_to do |format|
      format.js
    end
  end

  def start_testing
    @university_group = UniversityGroup.find(params[:university_group_id])
    p session[:lecturers_ids] = @university_group.lecturers.ids
    p session[:university_group_id] = @university_group.id

    respond_to do |format|
      format.js
    end
  end

  private
  def site_params
    params.require(:site).permit(:faculty_id, :department_id, :university_group_id)
  end
end
