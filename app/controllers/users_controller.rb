class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @collected_coins = current_user.collected_coins.count
    @monsters_killed = current_user.killed_monsters.count
    @deaths = current_user.deaths.count

    @monsters = Monster.all
  end
end
