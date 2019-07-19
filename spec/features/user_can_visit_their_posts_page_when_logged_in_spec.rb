require 'rails_helper'

RSpec.feature "View my posts", type: :feature do
  scenario "User logs in and visit their posts" do

    sign_up

    expect(current_path).to eq("/")
    expect(page).to have_content("You have successfully logged in user: user@gmail.com")
    click_link "View Your Posts"

    expect(current_path).to eq("/users/1/posts")
    expect(page).to have_content("Your posts:")
  end
end
