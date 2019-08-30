require 'rails_helper'

RSpec.describe MonstersController, type: :controller do
  describe 'POST #kill' do
    let(:user) { FactoryBot.create :user }
    let(:monster) { FactoryBot.create :monster }
    before(:each) { sign_in(user) }

    subject { post :kill, params: { monster_id: monster.id } }

    it 'creates a new record' do
      expect {
        subject
      }.to change { KilledMonster.count }.from(0).to(1)
    end

    context 'User has killed 0 monsters' do
      it "User gains a 'beginner' badge" do
        expect {
          subject
        }.to change { user.reload.badges.count }.from(0).to(1)
      end
    end

    context 'User has killed 99 monsters' do
    end

    context 'User has killed 999 monsters' do
    end

    context 'User has killed 9.999 monsters' do
    end

    context 'User has killed 99.999 monsters' do
    end
  end
end
