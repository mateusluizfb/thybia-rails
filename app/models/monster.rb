class Monster < ApplicationRecord
  include Merit::BadgeRulesMethods
  after_create :create_monster_trophies

  def create_monster_trophies
    (1..5).inject(Merit::Badge.count + 1) do |merit_count, trophy_tier|
      Merit::Badge.create!(
        id:          merit_count,
        multiple:    false,
        name:        "#{name} killer #{trophy_tier}",
        description: "Level #{trophy_tier} monster killer"
      )

      Merit::Badge.count + 1
    end
  end

  def badge(level)
    Merit::Badge
      .select {|b| b.name == "#{name} killer #{level}" }
      .first
  end
end
