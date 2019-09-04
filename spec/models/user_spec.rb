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
end
