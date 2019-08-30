require 'rails_helper'

RSpec.describe MonstersController, type: :controller do
  describe 'POST #kill' do
    let(:user) { FactoryBot.create :user }
    let(:monster) { FactoryBot.create :monster }
    before(:each) { sign_in(user) }

    it 'creates a new record' do
      expect {
        post :kill, params: { monster_id: monster.id }
      }.to change { KilledMonster.count }.from(0).to(1)
    end
  end
end
