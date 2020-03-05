class Race < ApplicationRecord
  belongs_to :prize
  has_many :snail_races
  has_many :snails, through: :snail_races
  has_many :bets, through: :snail_races

  validates :name, presence: true
end
