class Character < ActiveRecord::Base
  belongs_to :board

  validates :name,       presence: true
  validates :top_left_x, presence: true
  validates :top_left_y, presence: true
  validates :width,      presence: true
  validates :height,     presence: true
  validates :board_id,   presence: true

  def filename
    self.name.downcase + ".jpg"
  end
end
