require 'rails_helper'

RSpec.describe CollectedCoinsController, type: :controller do
  describe 'POST #create' do
    let(:user) { FactoryBot.create :user }
    let(:param_value) { 0 }
    before(:each) { sign_in(user) }

    subject { post :create, params: { value: param_value } }

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

    context 'User has collected 99 coins' do
      let!(:collected_coins) {
        FactoryBot.create(:collected_coin, value: 99, user: user)
      }
      let(:param_value) { 1 }

      it "User retains the 'Coins 1' trophy" do
        expect {
          subject
        }.to change { user.reload.badges.first&.name }.to('Coins 1')
      end

      it "User gains a 'Coins 2' trophy" do
        expect {
          subject
        }.to change { user.reload.badges.last&.name }.to('Coins 2')
      end
    end

    context 'User has collected 999 coins' do
      let!(:collected_coins) {
        FactoryBot.create(:collected_coin, value: 999, user: user)
      }
      let(:param_value) { 1 }

      it "User retains the 'Coins 1' trophy" do
        expect {
          subject
        }.to change { user.reload.badges.first&.name }.to('Coins 1')
      end

      it "User retains the 'Coins 2' trophy" do
        expect {
          subject
        }.to change { user.reload.badges[1]&.name }.to('Coins 2')
      end

      it "User gains a 'Coins 3' trophy" do
        expect {
          subject
        }.to change { user.reload.badges.last&.name }.to('Coins 3')
      end
    end

    context 'User has collected 9999 coins' do
      let!(:collected_coins) {
        FactoryBot.create(:collected_coin, value: 9999, user: user)
      }
      let(:param_value) { 1 }

      it "User retains the 'Coins 1' trophy" do
        expect {
          subject
        }.to change { user.reload.badges.first&.name }.to('Coins 1')
      end

      it "User retains the 'Coins 2' trophy" do
        expect {
          subject
        }.to change { user.reload.badges[1]&.name }.to('Coins 2')
      end

      it "User gains a 'Coins 3' trophy" do
        expect {
          subject
        }.to change { user.reload.badges[2]&.name }.to('Coins 3')
      end

      it "User gains a 'Coins 4' trophy" do
        expect {
          subject
        }.to change { user.reload.badges.last&.name }.to('Coins 4')
      end
    end

    context 'User has collected 99999 coins' do
      let!(:collected_coins) {
        FactoryBot.create(:collected_coin, value: 99999, user: user)
      }
      let(:param_value) { 1 }

      it "User retains the 'Coins 1' trophy" do
        expect {
          subject
        }.to change { user.reload.badges.first&.name }.to('Coins 1')
      end

      it "User retains the 'Coins 2' trophy" do
        expect {
          subject
        }.to change { user.reload.badges[1]&.name }.to('Coins 2')
      end

      it "User gains a 'Coins 3' trophy" do
        expect {
          subject
        }.to change { user.reload.badges[2]&.name }.to('Coins 3')
      end

      it "User gains a 'Coins 4' trophy" do
        expect {
          subject
        }.to change { user.reload.badges[3]&.name }.to('Coins 4')
      end

      it "User gains a 'Coins 5' trophy" do
        expect {
          subject
        }.to change { user.reload.badges.last&.name }.to('Coins 5')
      end
    end
  end
end
