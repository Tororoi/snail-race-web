class Snail < ApplicationRecord
  belongs_to :shell
  belongs_to :body
  has_many :snail_races
  has_many :races, through: :snail_races

  validates :name, presence: true
end
