require 'rails_helper'

RSpec.feature "User Post", type: :feature do
  scenario "User can see a New Post Form" do
    sign_up("user@gmail.com", "123456")
    click_link "View Your Posts"
    click_link "New post"
    expect(current_path).to eq("/users/1/posts/new")
    expect(page).to have_content("NEW POST")
  end
end
