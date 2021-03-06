require 'rails_helper'

RSpec.describe Post, type: :model do

  before(:each) do
    @user = User.new(email: "user@gmail.com", id: 1)
  end

  describe '#formatted_date_time' do
    it "should return the formatted date and time a post is created" do
      post = @user.posts.new(message: "Hello", user_id: 1, created_at: "2019-07-24 11:38:05.223399")
      expect(post.formatted_date_time).to eq "24 July 2019 11:38"
    end
  end
end
