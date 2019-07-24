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

  def display_all
    @all_posts = Post.all.order('created_at DESC')
    @formatted_posts = []
    @all_posts.as_json.each do |post|
      formatted_post = [
                        post["message"],
                        post["created_at"].strftime("%d %B %Y %H:%M"),
                        find_user(post["user_id"])
                        ]

      @formatted_posts << formatted_post
    end
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

  def find_user(user_id)
    @user = User.where(id: user_id)
    @user[0].email
  end
end
