class PostsController < ApplicationController

  def new
    @user = current_user
    @post = Post.new(user: @user)
  end

  def create
    # we need to add user information.
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
