class ClansController < ApplicationController
  def new
    @clan = Clan.new()
    @users = User.all.collect{|user| [user.name, user.id]}
  end
  
  def create
    @clan = Clan.new(clan_params) 
    if @clan.save
      redirect_to clans_path
    else
      render 'new' 
    end
  end

  def update 

  end 

  def edit 
  end

  def show 
    @clan = Clan.find(params[:id])
  end 

  def index
  end

  def destroy 
  end

private
  def clan_params
    params.require(:clan).permit(:name, :validade, :user_id)
  end
end
