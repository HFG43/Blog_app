class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def new
    @post = Post.find(params[:post_id])
    @user = @post.author
    @comment = @post.comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    @new_comment = @post.comments.new(comment_params)
    @new_comment.author = current_user
    if @new_comment.save
      flash[:success] = 'New comment created successfully'
      redirect_to user_post_path(@post.author, @post.id)
    else
      flash.now[:error] = 'Error: Comment could not be saved'
      render new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
