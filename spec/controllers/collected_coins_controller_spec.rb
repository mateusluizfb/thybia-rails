require 'rails_helper'

RSpec.describe CollectedCoinsController, type: :controller do
  describe 'POST #create' do
    let(:user) { FactoryBot.create :user }
    before(:each) { sign_in(user) }

    subject { post :create }

    it 'creates a new record' do
      expect {
        subject
      }.to change { CollectedCoin.count }.from(0).to(1)
    end

    context 'User has collected 0 coins' do
      it "User gains a 'Coins 1' trophy" do
        expect {
          subject
        }.to change { user.reload.badges.last&.name }.to('Coins 1')
      end
    end
  end
end
