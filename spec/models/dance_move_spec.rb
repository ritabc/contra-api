require 'rails_helper'

describe DanceMove do
  it { should belong_to :dance }
  it { should belong_to :move }
  it { should belong_to(:position).with_foreign_key('ending_position_id') } 
end
