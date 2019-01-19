class Dance < ApplicationRecord
  has_many :dance_moves
  has_many :moves, :through => :dance_moves

  # def get_moves_and_positions
  #   @moves_and_positions = []
  #   ## Get starting position
  #   if self.is_becket
  #     @moves_and_positions.push(Position.find_by(description: 'becket'))
  #   else
  #     @moves_and_positions.push(Position.find_by(description: 'improper'))
  #   end
  #
  #   ## For each move,...
  #   self.dance_moves.order(number_in_dance: :asc).each do |dance_move|
  #     @moves_and_positions.push(dance_move.move)
  #     @moves_and_positions.push(dance_move.position)
  #   end
  #   @moves_and_positions
  # end

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
