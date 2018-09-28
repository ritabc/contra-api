class Move < ApplicationRecord
  has_many :dance_moves
  has_many :dances, :through => :dance_moves
end
