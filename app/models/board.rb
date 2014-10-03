class Board < ActiveRecord::Base
  has_many :characters, dependent: :destroy
  has_many :scores,     dependent: :destroy
  has_many :players,    through: :scores

  validates :name, presence: true

  def filename
    self.name.downcase.gsub(" ", "_") + ".jpg"
  end

  def top_scores num
    self.scores.order(:score).limit( num )
  end

  # If the provided position is in the character, return the
  # location of the character; else return false
  def character_location(x, y, character_name)
    character = self.characters.select do |xter|
      xter.name == character_name
    end.first

    return false if character.nil?

    if ( x.to_i.between?(character.top_left_x.to_i, 
                    character.top_left_x.to_i + character.width.to_i) &&
         y.to_i.between?(character.top_left_y.to_i, 
                    character.top_left_y.to_i + character.height.to_i) )
      { name: character.name, x: character.top_left_x, 
        y: character.top_left_y, width: character.width, 
        height: character.height }
    else
      false
    end
  end
end
