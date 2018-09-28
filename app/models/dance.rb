class Dance < ApplicationRecord
  has_many :dance_moves
  has_many :moves, :through => :dance_moves
end
