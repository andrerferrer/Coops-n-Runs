class FarmsController < ApplicationController
  def index
    if params[:query].present?
      @farms = Farm.where("name ILIKE @@ :query OR syllabus ILIKE :query", query: "%{params[:query]}%")
    else
      @farms = Farm.all
    end
  end
end
