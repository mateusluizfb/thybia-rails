class User < ApplicationRecord
  has_merit

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :deaths
  has_many :collected_coins
  has_many :killed_monsters

  def killed_amount(monster)
    KilledMonster
      .with_user(self)
      .with_monster(monster)
      .count
  end

  def grant_monster_badge(monster) # rubocop:disable Metrics/AbcSize
    add_badge(monster.badge(1).id)
    add_badge(monster.badge(2).id) if killed_amount(monster) >= 100
    add_badge(monster.badge(3).id) if killed_amount(monster) >= 1000
    add_badge(monster.badge(4).id) if killed_amount(monster) >= 10_000
    add_badge(monster.badge(5).id) if killed_amount(monster) >= 100_000
  end
end
