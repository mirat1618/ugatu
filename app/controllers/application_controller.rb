class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError do
    flash[:danger] = 'У вас нет прав для просмотра этой страницы'
    redirect_to root_path
  end
end
