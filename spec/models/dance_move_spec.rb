require 'rails_helper'

describe DanceMove do
  it { should belong_to :dance }
  it { should belong_to :move }
end
