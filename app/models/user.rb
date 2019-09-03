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
    add_badge(monster.badge(1).id) if valid_for_badge?(monster, 0)
    add_badge(monster.badge(2).id) if valid_for_badge?(monster, 100)
    add_badge(monster.badge(3).id) if valid_for_badge?(monster, 1000)
    add_badge(monster.badge(4).id) if valid_for_badge?(monster, 10_000)
    add_badge(monster.badge(5).id) if valid_for_badge?(monster, 100_000)
  end

  def valid_for_badge?(monster, count)
    !badge?(monster, count) && killed_amount(monster) >= count
  end

  def badge?(monster, count)
    trophy_number = {
      0       => 1,
      100     => 2,
      1000    => 3,
      10_000  => 4,
      100_000 => 5
    }[count]

    badges.select {|b| b.name == "#{monster.name} killer #{trophy_number}" }.present?
  end
end
