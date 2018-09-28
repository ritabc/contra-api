require 'rails_helper'
## one position can be the end of many dance moves
## a dance move ends in one position
## this is a one to many relationship. Is it belongs_to or has_one?
## I am the dance_move and I _____ (ending) position. I am related to exactly one position, but I DO NOT have the foreign key.
## I am the dance_move and I BELONG_TO one (ending) position. I am related to exaclty one of these, and I have the foreign key
## I am the position, and I have_many dance_moves. I am related to many, and they have the foreign key

describe Position do
  it { should have_many(:moves).through(:possible_move_start_positions) }
  it { should have_many(:dance_moves).with_foreign_key('ending_position_id') } ## I need to tell rspec the name of the foreign key column on dance_moves
end
