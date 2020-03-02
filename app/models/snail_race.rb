class SnailRace < ApplicationRecord
  belongs_to :snail
  belongs_to :race
  has_many :bets
  has_many :users, through: :bets
end
