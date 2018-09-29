class PossibleMoveStartPosition < ApplicationRecord
  belongs_to :position
  belongs_to :move

  scope(:get_info_from_join, ->(position_id) do
    where(position_id: position_id)
  end)
end
