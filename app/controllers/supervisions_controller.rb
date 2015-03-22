class SupervisionsController < ApplicationController
  before_action :set_supervision, only: [:show, :edit, :update, :destroy]

  # GET /supervisions
  # GET /supervisions.json
  def index
    @supervisions = Supervision.all
  end

  # GET /supervisions/1
  # GET /supervisions/1.json
  def show

  end

  # GET /supervisions/new
  def new
    @supervision  = Supervision.new
    @supervision.notification_id = params[:id]
    render layout: false
  end

  # GET /supervisions/1/edit
  def edit
  end

  # POST /supervisions
  # POST /supervisions.json
  def create
    @supervision = Supervision.new(supervision_params)
    @notification = Notification.find(supervision_params[:notification_id])
    respond_to do |format|
      if @supervision.save
        @notification.supervised!
        format.html { redirect_to notifications_path, notice: 'Supervision was successfully created.' }
        format.json { render :show, status: :created, location: @supervision }
      else
        format.html { render :new }
        format.json { render json: @supervision.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supervisions/1
  # PATCH/PUT /supervisions/1.json
  def update
    respond_to do |format|
      if @supervision.update(supervision_params)
        format.html { redirect_to @supervision, notice: 'Supervision was successfully updated.' }
        format.json { render :show, status: :ok, location: @supervision }
      else
        format.html { render :edit }
        format.json { render json: @supervision.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supervisions/1
  # DELETE /supervisions/1.json
  def destroy
    @supervision.destroy
    respond_to do |format|
      format.html { redirect_to supervisions_url, notice: 'Supervision was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def notifications
    @notifications = Notification.all
    render  "supervisions/notifications/index"
  end

  def notifications_show
    @notification = Notification.find(params[:id])
    @fine         = Fine.find_by(notification_id: params[:id])
    render  "supervisions/notifications/show", layout: false
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supervision
      @supervision = Supervision.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supervision_params
      params.require(:supervision).permit(:notification_id, :observation)
    end
end
