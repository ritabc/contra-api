require 'rails_helper'

describe Dance do
  it { should have_many(:moves).through(:dance_moves) }
end
