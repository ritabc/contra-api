class MovesController < ApplicationController
  def available_next
    @moves = Move.available_next(params[:previous_move_ending_position_id])
    json_response(@moves)
  end

end
