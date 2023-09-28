require 'rails_helper'

RSpec.describe "PostsControllers", type: :request do
  describe "GET /users/:user_id/posts" do
    it "Index path works fine" do
      user_id = 1 
      get user_posts_path(user_id)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /users/:user_id/posts/:id" do
    it "Show path works fine" do
      user_id = 1
      post_id = 2
      get user_posts_path(user_id, post_id)
      expect(response).to have_http_status(200)
    end
  end
end
