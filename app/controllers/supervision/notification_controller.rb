module Supervision
  class NotificationController < ApplicationController
    before_action :set_notification, only: [:show, :edit, :update, :destroy]

    def index
      @notifications = Supervision::Notification.all
    end

    def create
      @notification = Supervision::Notification.new(notification_params.merge({state: :notified}))
      respond_to do |format|
        if @notification.save
          format.html { redirect_to supervision_notification_index_path }
          format.json { render :show, status: :created, location: @notification }
        else
          format.html { render :new }
          format.json { render json: @notification.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @notification.destroy
      respond_to do |format|
        format.html { redirect_to supervision_notification_index_path }
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Supervision::Notification.find(params[:id])
    end

    def notification_params
        params.permit(:owner_name,
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
          :observation);
    end
  end
end
