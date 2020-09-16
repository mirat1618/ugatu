class SiteController < ApplicationController
  skip_before_action :verify_authenticity_token
  def get_departments
    p params[:faculty_id]
    puts '11111'
    p request.xhr?
    respond_to do |format|
      format.js
    end

  end

  def get_groups
    puts params[:department_id]
  end

  private
  def site_params
    params.require(:site).permit(:faculty_id, :department_id)
  end
end
