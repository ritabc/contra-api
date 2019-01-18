class DanceMovesController < ApplicationController

  def steps
    dance = Dance.find(params['dance_id'])
    @moves_and_positions = dance.get_moves_and_positions
    json_response(@moves_and_positions)
  end

end

# def formation_moves
#   dance = Dance.find(params['dance_id'])
#   @is_becket_and_moves = dance.get_formation_and_moves
#   json_response(@is_becket_and_moves)
# end
