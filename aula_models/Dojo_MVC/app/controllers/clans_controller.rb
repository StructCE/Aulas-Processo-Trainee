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
    @clan = Clan.find(params[:id])
    if @clan.update(clan_params)
      redirect_to clan_path(@clan)
    else
      render 'edit'
  end 
end

  def edit
     @clan = Clan.find(params[:id])
     @users = User.all.collect{|user| [user.name, user.id]}
  end

  def show 
    @clan = Clan.find(params[:id])
  end 

  def index
    @clan = Clan.all
  end

  def destroy 
    @clan = Clan.find(params[:id])
    @clan.destroy
    redirect_to clans_path
  end

private
  def clan_params
    params.require(:clan).permit(:name, :validade, :user_id)
  end
end
