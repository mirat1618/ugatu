class SiteController < ApplicationController
  def get_departments
    faculty_id = params[:faculty_id]
    if !faculty_id.blank?
      faculty = Faculty.find(faculty_id)
      @departments_options = ApplicationController.render partial: 'site/departments_options', locals: { faculty: faculty }
    else
      @departments_options = ''
    end
    respond_to do |format|
      format.js
    end
  end

  def get_university_groups
    department_id = params[:department_id]
    if !department_id.blank?
      department = Department.find(department_id)
      @university_groups_options = ApplicationController.render partial: 'site/university_groups_options', locals: { department: department }
    else
      @university_groups_options = ''
    end
    respond_to do |format|
      format.js
    end
  end

  def get_start_button
    university_group_id = params[:university_group_id]
    if !university_group_id.blank?
      university_group = UniversityGroup.find(university_group_id)
      lecturers_count = university_group.lecturers.count
      @start_button = ApplicationController.render partial: 'site/start_button', locals: {
          university_group: university_group,
          lecturers_count: lecturers_count
      }
    else
      @start_button = ''
    end
    respond_to do |format|
      format.js
    end
  end

  private
  def site_params
    params.require(:site).permit(:faculty_id, :department_id)
  end
end
