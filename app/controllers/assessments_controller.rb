class AssessmentsController < ApplicationController
  def index
    @notification = Infraction.find(params[:id])
    @notification.fined
    @fine         = Fine.find_by(notification_id: params[:id])
  end
end
