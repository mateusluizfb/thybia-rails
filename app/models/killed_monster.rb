class KilledMonster < ApplicationRecord
  belongs_to :user
  belongs_to :monster

  scope :with_user, ->(killer) { where(user: killer) }
  scope :with_monster, ->(monster) { where(monster: monster) }

  def self.create_multiple(count, user, monster)
    killed_monsters = count.times.map do
      KilledMonster.new(user: user, monster: monster)
    end
    KilledMonster.import killed_monsters
  end
end
