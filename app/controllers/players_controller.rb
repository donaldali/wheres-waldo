class PlayersController < ApplicationController
  def new
    @player = Player.new
  end

  def create
    @player = Player.find_or_create_by(name: get_name)

    if @player
      set_player_name @player.name
      flash[:notice] = "You are playing as '#{ get_player_name }'"
      redirect_to boards_path
    else
      flash.now[:error] = "Could not find/create #{ params[:player][:name] }"
      render 'new'
    end
  end

  private

  def get_name
    name = params[:player][:name].strip[0...20]
    name.blank? ? Player.next_guest_name : name
  end
end
