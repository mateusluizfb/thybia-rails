class DeathsController < ApplicationController
  before_action :authenticate_user!

  def create
    (params[:value].to_i || 1).times do
      @death = Death.create user: current_user
    end

    redirect_to users_path
  end
end
