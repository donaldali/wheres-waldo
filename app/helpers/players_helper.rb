module PlayersHelper
  def set_player_name player_name
    session[:player_name] = player_name
  end

  def get_player_name
    session[:player_name]
  end

  def get_player
    Player.find_by(name: session[:player_name])
  end

  def any_player?
    !session[:player_name].nil?
  end
end
