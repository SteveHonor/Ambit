class InfractionsController < ApplicationController
  before_action :set_infraction, only: [:show, :edit, :update, :destroy]

  def index
    @infractions = Infraction.all
  end

  def new
    @infraction = Infraction.new
  end

  def edit
    @infraction = Infraction.find(params[:id])
    @fine         = Fine.where(infraction_id: params[:id])
  end

  def show
    @infraction = Infraction.find(params[:id])
    @fine         = Fine.find_by(infraction_id: params[:id])
    render 'infractions/show', layout: false
  end

  def create
    infraction = infraction_params.merge({state: :pending})
    laws         = params.delete(:laws)

    @infraction = Infraction.new(infraction)

    respond_to do |format|
      if @infraction.save
        format.html { redirect_to infractions_path }
        format.json { render :show, status: :created, location: @infraction }

        laws.each do |law|
          Fine.create(infraction_id: @infraction.id, law_id: law)
        end
      else
        format.html { render :new }
        format.json { render json: @infraction.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    infraction = infraction_params
    laws        = params.delete(:laws)

    respond_to do |format|
      if @infraction.update(infraction_params)
        format.html { redirect_to supervision_infractons_path }
      else
        format.html { render :edit }
        format.json { render json: @infraction.errors, status: :unprocessable_entity }
      end
    end

    if laws
      laws.each do |law|
        Fine.create(infraction_id: @infraction.id, law_id: law)
      end
    end
  end

  def destroy
    @infraction.down!
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  def delete_fine
    Fine.find(params[:id]).destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  def generate_notification
    @infraction = Infraction.find(params[:id])
    @infraction.notified

    @fine = Fine.find_by(infraction_id: params[:id])
    render  "supervision/assessments/index", layout: false
  end

  def generate_assessment
    @infraction = Infraction.find(params[:id])
    @infraction.notified

    @fine = Fine.find_by(infraction_id: params[:id])
    render  "supervision/assessments/index", layout: false
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_infraction
    @infraction = Infraction.find(params[:id])
  end

  def infraction_params
      params.require(:infraction).permit(
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
