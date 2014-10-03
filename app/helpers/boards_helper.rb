module BoardsHelper
  def board_class board
    board.name.downcase.gsub( " ", "-" )
  end

  def initialize_characters
    session[:characters_left] = @board.characters.map(&:name)
    session[:start_time] = Time.now
  end

  def update_characters_left(location, character_name)
    if location
      session[:characters_left].delete(character_name)
    end
  end

  def level_over?
    session[:characters_left].empty?
  end
end
