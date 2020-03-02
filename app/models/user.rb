class User < ApplicationRecord
    has_many :bets
    has_many :snail_races, through: :bets

    validates :name, presence: true
end
