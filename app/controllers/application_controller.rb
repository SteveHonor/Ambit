class ApplicationController < ActionController::Base
  include Pundit
  before_action :authenticate_user!
  layout :layout_by_resource
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) do | user |
        user.permit( :name, :email, :user_type, :password, :password_confirmation, :management_id)
     end
  end

  def layout_by_resource
    if user_signed_in?
      "application"
    else
      "login"
    end
  end

  private

  def setup?
    return  ( request.path == "/users/sign_up" || Management.all.count.zero? ) ? true : false
  end
end
