require 'rails_helper'

describe Move do
  it { should have_many(:dances).through(:dance_moves) }
  it { should have_many(:positions).through(:possible_move_start_positions)}
end
