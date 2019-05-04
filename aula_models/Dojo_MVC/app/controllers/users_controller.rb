class UsersController < ApplicationController
  def create
     @user = User.create(name: params[:user][:name], :email=> params[:user][:email])
  end

  def new
    @user = User.new()
  end

  def update 
  end

  def destroy 
  end

  def edit 
  end

  def show
    @user = User.find(params[:id])
  end

  def index 
    @users = User.all
  end  
end
