class KilledMonstersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_monster

  def kill
    killed_monsters = []

    params[:count].to_i.times do
      killed_monsters << KilledMonster.new(user: current_user, monster: @monster)
    end

    KilledMonster.import killed_monsters

    current_user.grant_monster_badge(@monster)
    @killed_monster = killed_monsters.first
    redirect_to users_path
  end

  private

  def set_monster
    @monster = Monster.find_by id: params[:monster_id]
  end
end
