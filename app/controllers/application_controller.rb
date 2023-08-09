class ApplicationController < ActionController::Base
  before_action :basic_path
  before_action :configure_permitted_parameters, only: [:create], if: :devise_controller?
  before_action :authenticate_user!, only: [:new]


  private
  def basic_path
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"] 
    end
  end   
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :password, :password_confirmation, :last_name_kanji, :first_name_kanji, :last_name_kana, :first_name_kana, :birthday])
  end
end
