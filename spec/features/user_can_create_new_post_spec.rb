require 'rails_helper'

RSpec.feature "When the user wants to Post", type: :feature do
  scenario "they should see a New Post form" do
    sign_up("user@gmail.com", "123456")
    click_link "View Your Posts"
    click_link "New post"
    expect(current_path).to eq("/users/1/posts/new")
    expect(page).to have_content("NEW POST")
  end

  scenario "they should be able to create a Post and see it" do
    sign_up("user@gmail.com", "123456")
    click_link "View Your Posts"
    click_link "New post"
    fill_in("post_message", with: "Hello")
    click_button "Submit"
    expect(current_path).to eq("/users/1/posts")
    expect(page).to have_content("Hello")
  end
end
