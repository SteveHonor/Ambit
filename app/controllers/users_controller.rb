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

    @user.update_attributes(user_params)

    if @user.errors
      render :edit
    else
      redirect_to action: "index"
    end
  end

  def create
    @user = User.new(user_params)
    pry
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
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar_cache, :avatar);
  end
end
