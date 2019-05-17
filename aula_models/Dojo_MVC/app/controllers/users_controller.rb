class UsersController < ApplicationController
  def create
     @user = User.new(user_params)
     if @user.save
      redirect_to user_path(@user)
     else 
      render 'new'
     end

  end

  def new
    @user = User.new()
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy 
    @user= User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

  def edit 
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def index 
    @users = User.all
  end
  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
