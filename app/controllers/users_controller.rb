class UsersController < ApplicationController
  before_action :authenticate_user!

  def death
    @death = Death.create user: current_user
  end
end
