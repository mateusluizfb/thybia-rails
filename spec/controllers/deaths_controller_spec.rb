require 'rails_helper'

RSpec.describe DeathsController, type: :controller do
  describe 'POST #death' do
    let(:user) { FactoryBot.create :user }
    before(:each) { sign_in(user) }

    subject { post :death }

    it 'creates a new record' do
      expect {
        subject
      }.to change { Death.count }.from(0).to(1)
    end

    context 'User has died 0 times' do
      it "User gains a 'Deaths 1' trophy" do
        expect {
          subject
        }.to change { user.reload.badges.last&.name }.to('Deaths 1')
      end
    end

    context 'User has died 99 times' do
      let!(:deaths) { FactoryBot.create_list(:death, 99, user: user) }

      it "User retains the 'Deaths 1' trophy" do
        expect {
          subject
        }.to change { user.reload.badges.first&.name }.to('Deaths 1')
      end

      it "User gains a 'Deaths 2' trophy" do
        expect {
          subject
        }.to change { user.reload.badges.last&.name }.to('Deaths 2')
      end
    end
  end
end
