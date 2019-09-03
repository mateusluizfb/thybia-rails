class DeathsController < ApplicationController
  before_action :authenticate_user!

  def create
    @death = Death.create user: current_user
  end
end
