class PositionsController < ApplicationController
  def index
    @positions = Position.all
    json_response(@positions)
  end
end
