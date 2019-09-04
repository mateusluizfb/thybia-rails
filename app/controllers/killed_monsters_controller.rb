class KilledMonstersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_monster

  def kill
    KilledMonster.create_multiple(params[:count].to_i, current_user, @monster)

    @monster.create_monster_trophies if @monster.badge(1).blank?
    current_user.grant_monster_badge(@monster)
    redirect_to users_path
  end

  private

  def set_monster
    @monster = Monster.find_by id: params[:monster_id]
  end
end
