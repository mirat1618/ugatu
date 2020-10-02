module Api
  class ApiController < ApplicationController
    include ActionController::HttpAuthentication::Token::ControllerMethods
    protect_from_forgery with: :null_session, if: Proc.new {|c| c.request.format.json?}
    before_action :rest_authenticate



    private

    def rest_authenticate
      result = authenticate_with_http_token do |token|
        User.find_by(auth_token: token).present?
        p token
      end
      render json: { error: 'Неверный токен'}, status: 403 unless result
    end
  end
end