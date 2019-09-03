class KilledMonstersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_monster

  def kill
    @killed_monster = KilledMonster.create(user: current_user, monster: @monster)

    redirect_to users_path
  end

  private

  def set_monster
    @monster = Monster.find_by id: params[:monster_id]
  end
end
