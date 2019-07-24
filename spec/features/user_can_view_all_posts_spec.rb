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
    click_link "New post"
    fill_in("post_message", with: "Hello")
    click_button "Submit"
    click_link "View All Posts"
    expect(current_path).to eq("/posts")
    expect(page).to have_content("Hello")
  end

  scenario "User can see other user's posts as well as their own" do
    sign_up("user@gmail.com")
    click_link "View Your Posts"
    click_link "New post"
    fill_in("post_message", with: "I am user 1")
    click_button "Submit"
    click_link "Sign out"
    sign_up("user2@gmail.com")
    click_link "View Your Posts"
    click_link "New post"
    fill_in("post_message", with: "I am user 2")
    click_button "Submit"
    click_link "View All Posts"
    expect(page).to have_content("I am user 1")
    expect(page).to have_content("I am user 2")

  end

end
