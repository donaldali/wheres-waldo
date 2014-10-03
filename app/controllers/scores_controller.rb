class ScoresController < ApplicationController

  before_action :some_player

  def show
    number_of_top_scores = 20

    @score = Score.find(params[:id])
    @top_scores = @score.board.top_scores( number_of_top_scores )
    @made_leaderboard = @top_scores.map(&:id).include?(@score.id)
  end
end
