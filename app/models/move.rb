class Move < ApplicationRecord
  has_many :dance_moves
  has_many :dances, :through => :dance_moves
  has_many :possible_move_start_positions
  has_many :positions, :through => :possible_move_start_positions

  scope :available_next, ->(previous_ending_position_id) do
    ## Try to get all moves with can start from a certain position
    joins(:possible_move_start_positions).merge(PossibleMoveStartPosition.get_info_from_join(previous_ending_position_id))
  end
end
