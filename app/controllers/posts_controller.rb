class PostsController < ApplicationController
  def index
    if params[:user_id]
      @author = User.find(params[:user_id])
      @posts = @author.posts
    end  
  end
  
  def show
    @post = Post.find(params[:user_id])
  end
end
