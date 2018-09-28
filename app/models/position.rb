class Position < ApplicationRecord
  has_many :possible_move_start_positions
  has_many :moves, :through => :possible_move_start_positions
  has_many :dance_moves, :foreign_key => 'ending_position_id'
end
