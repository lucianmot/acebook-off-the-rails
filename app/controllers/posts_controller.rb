class PostsController < ApplicationController

  def new
    @post = current_user.posts.new
  end

  def create
    # we need to add user information.
    @post = current_user.posts.create(post_params)
    redirect_to user_posts_path
  end

  def index
    # @posts = Post.where(user_id: current_user.id)
    @posts = current_user.posts.all
    p @posts
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
