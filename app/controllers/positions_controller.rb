class PositionsController < ApplicationController
  def index
    @positions = Position.all
    json_response(@positions)
  end

  def show
    description = params[:description]
    @position = Position.find_by(description: description)
    json_response(@position)
  end
end
