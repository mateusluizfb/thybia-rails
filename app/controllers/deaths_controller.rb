class DeathsController < ApplicationController
  before_action :authenticate_user!

  def create
    deaths = Death.create_multiple(params[:count].to_i, current_user)
    @death = deaths.last
    redirect_to users_path
  end
end
