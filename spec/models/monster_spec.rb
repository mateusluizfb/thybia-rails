require 'rails_helper'

RSpec.describe Monster, type: :model do
  describe '#create_monster_trophies' do
    let!(:monster) { FactoryBot.build(:monster, name: 'Sentinel') }

    describe 'creates five trophies for each tier' do
      before(:each) { monster.create_monster_trophies }

      it { expect(monster.badge(1)&.name).to eq("Sentinel killer 1") }
      it { expect(monster.badge(2)&.name).to eq("Sentinel killer 2") }
      it { expect(monster.badge(3)&.name).to eq("Sentinel killer 3") }
      it { expect(monster.badge(4)&.name).to eq("Sentinel killer 4") }
      it { expect(monster.badge(5)&.name).to eq("Sentinel killer 5") }
    end
  end

end
