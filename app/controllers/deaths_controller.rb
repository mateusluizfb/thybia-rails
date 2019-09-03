class DeathsController < ApplicationController
  before_action :authenticate_user!

  def create
    deaths = Array.new(params[:count].to_i) { Death.new(user: current_user) }
    Death.import deaths

    @death = deaths.last
    redirect_to users_path
  end
end
