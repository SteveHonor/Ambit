class SetupController < ActionController::Base
  def index
    if Management.all.count.zero?
      @management = Management.new
      @action = 1
    else
      @user = User.new
      @action = 2
      render 'setup/index'
    end
  end

  def create
    if Management.create(management_params)
      @user = User.new
      @action = 2
      render 'setup/index'
    end
  end
end

private

def management_params
  params.require(:setup).permit(:name, :prefecture, :zip_code, :address, :address_number, :district, :city, :state, :phone)
end
