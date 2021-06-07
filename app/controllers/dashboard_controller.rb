class DashboardController < ApplicationController

  def index
    @farms = Farm.where(user:current_user)
  end
end
