require 'rails_helper'

describe PossibleMoveStartPosition do
  it { should belong_to :position }
  it { should belong_to :move }
end
