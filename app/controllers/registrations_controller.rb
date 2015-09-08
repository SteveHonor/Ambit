class RegistrationsController < Devise::RegistrationsController
  prepend_before_filter :require_no_authentication, only: [:cancel ]

  def create
    super
  end

  def new
    super
  end
end
