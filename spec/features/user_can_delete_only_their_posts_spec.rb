require 'rails_helper'
require 'pry'

RSpec.feature "Delete & edit only my posts", type: :feature do
  scenario "user only sees edit & delete links for their posts" do
    # User 1 - sign in, create a post, sign out
    sign_up("user1@gmail.com", "123456")
    click_link "View Your Posts"
    create_a_post("I love monsieur Travis")
    click_link "Sign out"
    # User 2 - sign in, create a post, view all posts
    sign_up("user2@gmail.com", "123456")
    click_link "View Your Posts"
    create_a_post("J'adore la baguette")
    click_link "View All Posts"
    # grab posts from database
    post1 = Post.all.where(message: "I love monsieur Travis")[0]
    post2 = Post.all.where(message: "J'adore la baguette")[0]    
    
    expect(page).to have_content("I love monsieur Travis")
    expect(page).to have_content("J'adore la baguette")
    expect(page).not_to have_link("Edit", href: "/users/#{post1.user_id}/posts/#{post1.id}/edit")
    expect(page).not_to have_link("Delete", href: "/users/#{post1.user_id}/posts/#{post1.id}")
    expect(page).to have_link("Edit", href: "/users/#{post2.user_id}/posts/#{post2.id}/edit")    
    expect(page).to have_link("Delete", href: "/users/#{post2.user_id}/posts/#{post2.id}")
  end
end
