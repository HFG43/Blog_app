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

    it 'includes correct placeholder text in Index' do
      get users_path
      expect(response.body).to include('Here you will soon see the list of all users')
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

    it 'includes correct placeholder text in Show' do
      get user_path(@user)
      expect(response.body).to include('Here you will be able to see all data refered to an user')
    end
  end
end
