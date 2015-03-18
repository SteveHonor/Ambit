module Supervision
  class NotificationsController < ApplicationController
    before_action :set_notification, only: [:show, :edit, :update, :destroy]

    def index
      @notifications = Supervision::Notification.all
    end

    def new
      @notification = Supervision::Notification.new
    end

    def edit
      @notification = Supervision::Notification.find(params[:id])
      @fine         = Fine.where(notification_id: params[:id])
    end

    def show
      @notification = Supervision::Notification.find(params[:id])
      @fine         = Fine.find_by(notification_id: params[:id])
      render  "supervision/notifications/show", layout: false
    end

    def create
      notification = notification_params.merge({state: :notified})
      laws         = params.delete(:laws)

      @notification = Supervision::Notification.new(notification)

      respond_to do |format|
        if @notification.save
          format.html { redirect_to supervision_notifications_path }
          format.json { render :show, status: :created, location: @notification }
        else
          format.html { render :new }
          format.json { render json: @notification.errors, status: :unprocessable_entity }
        end
      end

      laws.each do |law|
        Fine.create(notification_id: @notification.id, law_id: law)
      end
    end

    def update
      notification = notification_params
      laws         = params.delete(:laws)

      respond_to do |format|
        if @notification.update(notification_params)
          format.html { redirect_to supervision_notifications_path }
        else
          format.html { render :edit }
          format.json { render json: @notification.errors, status: :unprocessable_entity }
        end
      end

      if laws
        laws.each do |law|
          Fine.create(notification_id: @notification.id, law_id: law)
        end
      end
    end

    def destroy
      @notification.destroy
      respond_to do |format|
        format.html { redirect_to supervision_notifications_path }
        format.json { head :no_content }
      end
    end

    def delete_fine
      Fine.find(params[:id]).destroy
      respond_to do |format|
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Supervision::Notification.find(params[:id])
    end

    def notification_params
        params.require(:supervision_notification).permit(
          :owner_name,
          :owner_identifier,
          :owner_zip_code,
          :owner_address,
          :owner_address_number,
          :owner_address_complement,
          :owner_district,
          :owner_city,
          :owner_state,
          :owner_ddd_mobile,
          :owner_mobile,
          :owner_ddd_phone,
          :owner_phone,
          :property_zone,
          :property_zip_code,
          :property_address,
          :property_address_number,
          :property_address_complement,
          :property_district,
          :property_city,
          :property_state,
          :property_meter,
          :property_block,
          :property_allotment,
          :property_observation,
          :notify_description);
    end
  end
end
