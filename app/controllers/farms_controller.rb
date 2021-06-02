class FarmsController < ApplicationController
  def index
    @farms = Farm.all
  end

  def show
    @farm = Farm.find(params[:laying_farm])
  end

  def new
    @farm = Farm.new
    authorize @farm
  end
end
