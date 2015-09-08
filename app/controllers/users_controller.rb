class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.valid_password?(user_params[:current_password])
      if  not params[:user][:password].empty?
        if params[:user][:password] == params[:user][:password_confirmation]
          user = user_params
          user.delete(:current_password)
          @user.update_attributes(user)
        end
      else
        user = user_params_change_password
        user.delete(:current_password)
        user.delete(:password)
        user.delete(:password_confirmation)
        @user.update_attributes(user)
      end
    end

    if not @user.errors.count.zero?
      render :edit
    else
      redirect_to action: "index"
    end
  end

  def create
    debugger
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit( :name, :email, :current_password, :avatar_cache, :avatar, :user_type, :management_id);
  end

  def user_params_change_password
    params.require(:user).permit( :name, :email, :password, :password_confirmation, :current_password, :avatar_cache, :avatar, :user_type, :management_id);
  end
end
