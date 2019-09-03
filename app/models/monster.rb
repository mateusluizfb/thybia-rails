class Monster < ApplicationRecord
  include Merit::BadgeRulesMethods
  after_create :create_monster_trophy

  def create_monster_trophy
    5.times do |i|
      trophy_index = i + 1
      count = Merit::Badge.count + 1

      Merit::Badge.create!(
        id:          count,
        name:        "#{name} killer #{trophy_index}",
        description: "Level #{trophy_index} monster killer"
      )
    end
  end
end
