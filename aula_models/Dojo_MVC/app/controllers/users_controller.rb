class UsersController < ApplicationController
  def create
     @user = User.new(user_params)
  end

  def new
    @user = User.new 
  end

  def update 
  end

  def destroy 
  end

  def edit 
  end

  def show
  end

  def index 
  end  
end
