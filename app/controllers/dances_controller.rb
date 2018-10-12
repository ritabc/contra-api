class DancesController < ApplicationController
  def index
    @dances = Dance.all
    json_response(@dances)
  end

  def show
    dance_id = params[:id]
    @dance = Dance.find(dance_id)
    json_response(@dance)
  end
end
