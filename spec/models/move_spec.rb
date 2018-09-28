require 'rails_helper'

describe Move do
  it { should have_many(:dances).through(:dance_moves) }
end
