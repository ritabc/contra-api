class Move < ApplicationRecord
  has_many :dance_moves
  has_many :dances, :through => :dance_moves
  has_many :possible_move_start_positions
  has_many :positions, :through => :possible_move_start_positions
end
