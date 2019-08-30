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
      it "User gains a 'Monster killer 1' trophy" do
        expect {
          subject
        }.to change { user.reload.badges.last&.name }.to('Monster killer 1')
      end
    end

    context 'User has killed 99 monsters' do
      let!(:monsters) {
        FactoryBot.create_list(
          :killed_monster, 99,
          user: user,
          monster: monster
        )
      }

      it 'user retains the "Monster Killer 1 badge"' do
        expect {
          subject
        }.to change { user.reload.badges.first&.name }.to('Monster killer 1')
      end

      it 'user gains a "Monster killer 2" badge' do
        expect {
          subject
        }.to change { user.reload.badges.last&.name }.to('Monster killer 2')
      end
    end

    context 'User has killed 999 monsters' do
    end

    context 'User has killed 9.999 monsters' do
    end

    context 'User has killed 99.999 monsters' do
    end
  end
end
