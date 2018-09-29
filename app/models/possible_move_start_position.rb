class PossibleMoveStartPosition < ApplicationRecord
  belongs_to :position
  belongs_to :move

  scope(:get_info_from_join, ->(previous_ending_position_id) do
    where(position_id: previous_ending_position_id)
  end)
end
