require 'rails_helper'

RSpec.describe 'PostsControllers', type: :request do
  before(:each) do
    @user = User.create(name: 'Hernan', bio: 'Back end developer')
    @post = Post.create(author: @user, title: 'Spec test', text: 'This is a request test')
  end

  describe 'GET /users/:user_id/posts' do
    it 'Index path works fine' do
      get user_posts_path(@user.id)
      expect(response).to have_http_status(200)
    end

    it 'renders Index path template' do
      get user_posts_path(@user.id)
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in Index' do
      get user_posts_path(@user)
      expect(response.body).to include('Here you will see all the posts of a particular user')
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    it 'Show path works fine' do
      user_id = @user.id
      post_id = @post.id
      get user_post_path(user_id, post_id)
      expect(response).to have_http_status(200)
    end

    it 'renders Show path template' do
      user_id = @user.id
      post_id = @post.id
      get user_path(user_id, post_id)
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in Show' do
      get user_post_path(@user, @post)
      expect(response.body).to include('Comments & likes of a particular post from a particular user')
    end
  end
end
