class Dance < ApplicationRecord
  has_many :dance_moves
  has_many :moves, :through => :dance_moves

  def get_dance_moves
    @dance_moves = []
  end

  def get_formation_and_moves
    @dance_info = {:is_becket => self.is_becket, :moves => [], :name => self.name, :writer => self.writer, :description => self.description}
    self.dance_moves.order(number_in_dance: :asc).each do |dance_move|
      @dance_info[:moves].push(dance_move.move)
    end
    @dance_info
  end
end
