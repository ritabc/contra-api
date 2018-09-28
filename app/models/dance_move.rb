class DanceMove < ApplicationRecord
  belongs_to :dance
  belongs_to :move
  belongs_to :position, :foreign_key => 'ending_position_id'
end
