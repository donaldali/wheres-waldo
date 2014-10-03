class Player < ActiveRecord::Base
  has_many :scores, dependent: :destroy
  has_many :boards, through: :scores

  validates :name, presence: true

  def Player.next_guest_name
    "Guest #{ Player.count + 1 }"
  end
end
