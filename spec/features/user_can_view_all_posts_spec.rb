require 'rails_helper'

RSpec.feature "View all posts", type: :feature do
  scenario "User can navigate to the all-posts-page via their welcome page" do
    sign_up
    click_link "View All Posts"
    expect(current_path).to eq("/posts")
  end

  scenario "User can see the posts they have made on the all posts page" do
    sign_up
    click_link "View Your Posts"
    create_a_post("Hello")
    click_link "View All Posts"
    expect(current_path).to eq("/posts")
    expect(page).to have_content("Hello")
  end

  scenario "User can see other user's posts as well as their own" do
    sign_up("user@gmail.com")
    click_link "View Your Posts"
    create_a_post("I am user 1")
    click_link "Sign out"
    sign_up("user2@gmail.com")
    click_link "View Your Posts"
    create_a_post("I am user 2")
    click_link "View All Posts"
    expect(page).to have_content("I am user 1")
    expect(page).to have_content("I am user 2")
  end

  scenario "User can navigate back to their personal post page after viewing all posts" do
    sign_up
    click_link "View Your Posts"
    create_a_post("Hello")
    click_link "View All Posts"
    click_link "View Your Posts"
    expect(current_path).to eq("/users/1/posts")
  end

  scenario "User can see the post creators email next to the post" do
    sign_up("user@gmail.com")
    click_link "View Your Posts"
    create_a_post("I am user 1")
    click_link "View All Posts"
    expect(page).to have_content("user@gmail.com")
  end

end
