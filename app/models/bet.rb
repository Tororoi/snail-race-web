class Bet < ApplicationRecord
  belongs_to :snail_race
  belongs_to :user
end
