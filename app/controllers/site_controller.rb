class SiteController < ApplicationController
  def show_next_options
    model = params[:model]
    model_id = params[:model_id]
    @parent_form_group_id = params[:parent_form_group_id]

    case model
    when 'faculty'
      options = Faculty.find_by(id: model_id).departments
    when 'department'
      options = Department.find_by(id: model_id).university_groups
    end

    @options_partial = ApplicationController.render(partial: 'site/options', locals: {
        options: options
    })

    respond_to do |format|
      format.js
    end
  end

  def show_start_button
    university_group = UniversityGroup.find_by(id: params[:university_group_id])
    lecturers_count = university_group.lecturers.count
    disabled = true if lecturers_count == 0
    @start_button_partial = ApplicationController.render(partial: 'site/start_button', locals: {
        university_group: university_group,
        lecturers_count: lecturers_count,
        disabled: disabled
    })

    respond_to do |format|
      format.js
    end
  end

  def start_testing
    @university_group = UniversityGroup.find(params[:university_group_id])
    session[:lecturers_ids] = @university_group.lecturers.ids
    session[:university_group_id] = @university_group.id

    respond_to do |format|
      format.js
    end
  end

  private
    def site_params
      params.require(:site).permit(:faculty_id, :department_id, :university_group_id)
    end
end
