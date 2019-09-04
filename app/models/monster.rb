class Monster < ApplicationRecord
  include Merit::BadgeRulesMethods
  after_create :create_monster_trophies

  def create_monster_trophies
    5.times do |i|
      trophy_index = i + 1
      count = Merit::Badge.count + 1

      Merit::Badge.create!(
        id:          count,
        multiple:    false,
        name:        "#{name} killer #{trophy_index}",
        description: "Level #{trophy_index} monster killer"
      )
    end
  end

  def badge(level)
    Merit::Badge
      .select {|b| b.name == "#{name} killer #{level}" }
      .first
  end
end
