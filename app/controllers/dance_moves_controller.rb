class DanceMovesController < ApplicationController

  def steps
    dance = Dance.find(params['dance_id'])
    @moves_and_positions = dance.get_moves_and_positions
    json_response(@moves_and_positions)
  end

end
