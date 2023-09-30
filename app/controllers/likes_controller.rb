class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.new(author: current_user)
  
    if @like.save
      redirect_to user_post_path(@post.author, @post)
    else
      flash[:error] = "Error."
      redirect_to user_post_path(@post.author, @post)
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = Like.find_by(post: @post, author: current_user)

    if @like.destroy
      puts "Eliminated"
    redirect_to  user_post_path(@post.author, @post) 
    else
      flash[:error] = "Error"
    redirect_to  user_post_path(@post.author, @post)  
    end 
  end
end
