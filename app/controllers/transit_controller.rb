class TransitController < ApplicationController
  def index
    @transits = Transit.all
    @buses = Bus.all
  end

  def transitUpdate
    @transitupdate = Transit.all
    render json: @transitupdate
  end

  def busUpdate
    @busupdate = Bus.all
    render json: @busupdate
  end

end
