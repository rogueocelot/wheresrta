class TransitController < ApplicationController
  def index
    @transits = Transit.all
  end

  def transitUpdate
    @transitupdate = Transit.all
    render json: @transitupdate
  end

end
