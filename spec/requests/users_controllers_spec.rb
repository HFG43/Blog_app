require 'rails_helper'

RSpec.describe 'UsersControllers', type: :request do
  before(:each) do
    @user = User.create!(name: 'Hernan', bio: 'Back end developer')
  end

  describe 'GET /users' do
    it 'Index path works fine' do
      get users_path
      expect(response).to have_http_status(200)
    end

    it 'renders Index path template' do
      get users_path
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /users/:user_id' do
    it 'Show path works fine' do
      get user_path(@user)
      expect(response).to have_http_status(200)
    end

    it 'renders Show path template' do
      get user_path(@user)
      expect(response).to render_template(:show)
    end
  end
end
