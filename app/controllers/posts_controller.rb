class PostsController < ApplicationController

  def new
    @post = current_user.posts.new
  end

  # def find
  #  @post = Post.find(params[:id])
  # end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to user_posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_posts_path
  end

  def index
    @posts = current_user.posts.all.order('created_at DESC')
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
