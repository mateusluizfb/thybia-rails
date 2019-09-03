# Be sure to restart your server when you modify this file.
#
# +grant_on+ accepts:
# * Nothing (always grants)
# * A block which evaluates to boolean (recieves the object as parameter)
# * A block with a hash composed of methods to run on the target object with
#   expected values (+votes: 5+ for instance).
#
# +grant_on+ can have a +:to+ method name, which called over the target object
# should retrieve the object to badge (could be +:user+, +:self+, +:follower+,
# etc). If it's not defined merit will apply the badge to the user who
# triggered the action (:action_user by default). If it's :itself, it badges
# the created object (new user for instance).
#
# The :temporary option indicates that if the condition doesn't hold but the
# badge is granted, then it's removed. It's false by default (badges are kept
# forever).

module Merit
  class BadgeRules
    include Merit::BadgeRulesMethods

    def initialize
      register_deaths_trophies
      register_monster_killer_trophies
      register_collected_coins_trophies
    end

    def register_monster_killer_trophies # rubocop:disable Metrics/AbcSize
      grant_on 'killed_monsters#kill', badge: 'Monster killer 1'
      grant_on 'killed_monsters#kill', badge: 'Monster killer 2' do |killed_monster|
        killed_monster.user.killed_amount(monster: killed_monster.monster) >= 100
      end
      grant_on 'killed_monsters#kill', badge: 'Monster killer 3' do |killed_monster|
        killed_monster.user.killed_amount(monster: killed_monster.monster) >= 1000
      end
      grant_on 'killed_monsters#kill', badge: 'Monster killer 4' do |killed_monster|
        killed_monster.user.killed_amount(monster: killed_monster.monster) >= 10_000
      end
      grant_on 'killed_monsters#kill', badge: 'Monster killer 5' do |killed_monster|
        killed_monster.user.killed_amount(monster: killed_monster.monster) >= 100_000
      end
    end

    def register_deaths_trophies # rubocop:disable Metrics/AbcSize
      grant_on 'deaths#create', badge: 'Deaths 1'
      grant_on 'deaths#create', badge: 'Deaths 2' do |death|
        death.user.deaths.count >= 100
      end
      grant_on 'deaths#create', badge: 'Deaths 3' do |death|
        death.user.deaths.count >= 1000
      end
      grant_on 'deaths#create', badge: 'Deaths 4' do |death|
        death.user.deaths.count >= 10_000
      end
      grant_on 'deaths#create', badge: 'Deaths 5' do |death|
        death.user.deaths.count >= 100_000
      end
    end

    def register_collected_coins_trophies # rubocop:disable Metrics/AbcSize
      grant_on 'collected_coins#create', badge: 'Coins 1'
    end
  end
end
