class KilledMonster < ApplicationRecord
  belongs_to :user
  belongs_to :monster

  scope :with_user, ->(killer) { where(user: killer) }
  scope :with_monster, ->(monster) { where(monster: monster) }
end
