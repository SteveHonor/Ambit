class ApplicationController < ActionController::Base
  include Pundit
  before_action :authenticate_user!
  layout :layout_by_resource

  protected

  def layout_by_resource
    if user_signed_in?
      "application"
    else
      "login"
    end
  end
end
