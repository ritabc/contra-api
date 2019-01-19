class DanceMovesController < ApplicationController

  def get_dance_moves_information
    @dance = Dance.find(params['dance_id'])
    @angular_dance_moves = []

    @dance.dance_moves.order(number_in_dance: :asc).each do |d_m|
      angular_dance_move = {:move => d_m.move, :endingPosition => d_m.position, :isProgression => d_m.is_progression}
      @angular_dance_moves.push(angular_dance_move)
    end

    # return angular_dance_moves: an array of 'danceMoves; which are portions of dance_moves - each will include ONLY the Move (same in Rails & Ang), the ending Position (same in Rails & Ang), and isProgression boolean
    # will not include: number_in_dance
    ## Probably a good place for serialization (down the line)
    json_response(@angular_dance_moves)
  end

end

# def formation_moves
#   dance = Dance.find(params['dance_id'])
#   @is_becket_and_moves = dance.get_formation_and_moves
#   json_response(@is_becket_and_moves)
# end
