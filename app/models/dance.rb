class Dance < ApplicationRecord
  has_many :dance_moves
  has_many :moves, :through => :dance_moves

  def get_moves_and_positions
    @moves_and_positions = []
    ## Get starting position
    if self.is_becket
      @moves_and_positions.push(Position.find_by(description: 'becket'))
    else
      @moves_and_positions.push(Position.find_by(description: 'improper'))
    end

    ## For each move,...
    self.dance_moves.order(number_in_dance: :asc).each do |dance_move|
      @moves_and_positions.push(dance_move.move)
      @moves_and_positions.push(dance_move.position)
    end
    @moves_and_positions
  end

end
