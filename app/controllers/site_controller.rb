class SiteController < ApplicationController
  def get_departments
    faculty_id = params[:faculty_id]
    if !faculty_id.blank?
      faculty = Faculty.find(faculty_id)
      @partial = ApplicationController.render partial: 'site/departments_options', locals: {faculty: faculty}
    else
      @partial = ''
    end
    puts 'Faculty id: ', params[:faculty_id]

    p request.xhr?
    # @partial = ActionController::Base.renderer.render(partial: 'site/departments_options', locals: {faculty: faculty})

    respond_to do |format|
      format.js
    end

  end

  def get_groups

  end

  private
  def site_params
    params.require(:site).permit(:faculty_id, :department_id)
  end
end
