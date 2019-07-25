require 'rails_helper'

RSpec.describe Post, type: :model do
  it "Returns the author of the post's email" do
    user = User.new(email: "user@gmail.com", id: 1)
    post = user.posts.new(message: "Hello", user_id: 1)

    expect(post.user_email).to eq "user@gmail.com"
  end

  it "Returns the formatted date and time a post is created" do
    
  end
end
