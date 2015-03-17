module Supervision
  class AssessmentsController < ApplicationController
    def update
      @notification = Supervision::Notification.find(params[:id])
      @notification.supervised
      @fine         = Fine.find_by(notification_id: params[:id])
      render  "supervision/assessments/index", layout: false
    end
  end
end
