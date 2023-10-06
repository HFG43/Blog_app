class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    return unless params[:user_id]

    @author = User.find(params[:user_id])
    @posts = @author.posts
  end

  def new
    @user = current_user
    @post = @user.posts.new
  end

  def create
    new_post = current_user.posts.new(post_params)
    if new_post.save
      flash[:success] = 'New post creted successfully'
      redirect_to user_posts_path(current_user)
    else
      flash[:error] = 'Error: Post could not be saved'
      render new
    end
  end

  def show
    @user = current_user
    @author = User.find(params[:user_id])
    @author_posts = @author.posts
    @post = @author_posts.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
