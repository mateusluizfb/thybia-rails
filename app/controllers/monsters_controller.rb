class MonstersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_monster

  def kill
    KilledMonster.create(user: current_user, monster: @monster)
  end

  private

  def set_monster
    @monster = Monster.find_by id: params[:monster_id]
  end
end
