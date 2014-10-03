class ScoresController < ApplicationController

  before_action :some_player
  before_action :correct_player, only: :show

  def show
    number_of_top_scores = 20

    @score = Score.find(params[:id])
    @top_scores = @score.board.top_scores( number_of_top_scores )
    @made_leaderboard = @top_scores.map(&:id).include?(@score.id)
  end

  private

  def correct_player
    unless get_player.id == Score.find(params[:id]).player.id
      redirect_to boards_url, notice: "You can only view your score"
    end
  end
end
