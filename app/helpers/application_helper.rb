module ApplicationHelper
  def some_player
    unless any_player? 
      redirect_to root_url, notice: "Enter your name, or play as a Guest"
    end
  end
end
