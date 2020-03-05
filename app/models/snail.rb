class Snail < ApplicationRecord
  belongs_to :shell
  belongs_to :body
  has_many :snail_races
  has_many :races, through: :snail_races

  validates :name, presence: true

  def speed(race)
    if self.favorite_food == race.prize.name
      rand(13.0..16.0) - 1 
    else
      rand(13.0..16.0)
    end
  end
end
