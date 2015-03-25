class AssessmentsController < ApplicationController
  def generate_assessment
    @notification = Infraction.find(params[:id])
    @notification.fined
    @fine         = Fine.find_by(notification_id: params[:id])
    render  "supervision/assessments/index", layout: false
  end
end
