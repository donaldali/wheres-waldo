class BoardsController < ApplicationController
  require "date"

  before_action :some_player

  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
    @characters = @board.characters
    initialize_characters
  end

  def check_character
    @board    = Board.find(params[:id])
    location  = @board.character_location(params[:x], params[:y], 
                                       params[:character])
    update_characters_left(location, params[:character])

    if level_over?
      score = save_score( @board )
      render js: "window.location.pathname='#{score_path(score)}'"
    else
      render json: location
    end

  end

  private

  def save_score board
    duration = ( Time.now - Time.parse(session[:start_time]) ).floor
    board.scores.create({ score: duration, player_id: get_player.id })
  end
end
