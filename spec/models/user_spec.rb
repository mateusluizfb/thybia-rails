require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#killed_amount' do
    let(:user) { FactoryBot.create(:user) }
    let(:monster) { FactoryBot.create(:monster) }
    let!(:killed_monsters) do
      FactoryBot.create_list(
        :killed_monster, 10,
        monster: monster,
        user: user
      )
    end

    it 'returns the amount of monsters killed for the same type' do
      expect(user.killed_amount(monster)).to eq(10)
    end
  end

  describe '#badge?' do
    let(:user) { FactoryBot.create(:user) }
    let!(:monster) { FactoryBot.create(:monster, name: 'Smoung') }
    let(:monster_badge) { monster.badge(3) }

    context 'user has the trophy for the given count' do
      it 'returns true' do
        user.add_badge(monster_badge.id)
        expect(user.badge?(monster, 1000)).to be_truthy
      end
    end

    context "user hasn't the trophy for the given count" do
      it 'returns false' do
        expect(user.badge?(monster, 1000)).to be_falsey
      end
    end

  end
end
