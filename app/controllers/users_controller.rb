class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)

    if @user.errors
      flash[:error] = @user.errors.full_messages
      render :edit
    else
      flash[:error] = "Successfully created..."
      redirect_to action: "index"
    end
  end

  private

  def user_params
      params.require(:user).permit(:all);
  end
end
