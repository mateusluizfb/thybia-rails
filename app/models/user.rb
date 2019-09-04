class User < ApplicationRecord
  has_merit

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :deaths
  has_many :collected_coins
  has_many :killed_monsters

  enum trophy_count_tier: {
    0       => 1,
    100     => 2,
    1000    => 3,
    10_000  => 4,
    100_000 => 5
  }

  def killed_amount(monster)
    KilledMonster
      .with_user(self)
      .with_monster(monster)
      .count
  end

  def badge?(monster, count)
    tier = User.trophy_count_tiers[count]
    badges.select {|b| b.name == "#{monster.name} killer #{tier}" }.present?
  end

  def valid_for_badge?(monster, count)
    !badge?(monster, count) && killed_amount(monster) >= count
  end

  def grant_monster_badge(monster)
    User.trophy_count_tiers.each do |count, tier|
      add_badge(monster.badge(tier).id) if valid_for_badge?(monster, count)
    end
  end
end
