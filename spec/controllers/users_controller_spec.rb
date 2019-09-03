require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    let(:user) { FactoryBot.create :user }
    before(:each) { sign_in(user) }

    it 'renders the view' do
      get :index
      expect(response).to render_template('users/index')
    end
  end
end
