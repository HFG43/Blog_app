class LikesController < ApplicationController
  before_action :authenticate_user!, only: %i[destroy create]

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.new(author: current_user)
    flash[:error] = 'Error.' unless @like.save
    redirect_to user_post_path(@post.author, @post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = Like.find_by(post: @post, author: current_user)
    flash[:error] = 'Error' unless @like.destroy
    redirect_to user_post_path(@post.author, @post)
  end
end
