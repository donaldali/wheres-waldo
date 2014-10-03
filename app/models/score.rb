class Score < ActiveRecord::Base
  belongs_to :board
  belongs_to :player

  validates :score,     presence: true
  validates :player_id, presence: true
  validates :board_id,  presence: true
end
