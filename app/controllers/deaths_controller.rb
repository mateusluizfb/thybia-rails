class DeathsController < ApplicationController
  before_action :authenticate_user!

  def create
    params[:count].to_i.times do
      @death = Death.create user: current_user
    end

    redirect_to users_path
  end
end
