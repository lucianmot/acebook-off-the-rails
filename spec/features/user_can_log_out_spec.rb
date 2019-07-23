require 'rails_helper'

# As a user
# So that I can use the application securely
# I can log out of my account and receive a confirmation

RSpec.feature "Log out", type: :feature do
  scenario "User logs in and immediately logs out with confirmation" do
    sign_up
    expect(page).to have_content("You have successfully logged in user: user@gmail.com")
    click_link "Sign out"
    expect(page).to have_content("Signed out successfully")
  end

  scenario "When a user logs out and a new user logs in the new user becomes the current user" do
    sign_up("user1@gmail.com")
    expect(page).to have_content("You have successfully logged in user: user1@gmail.com")
    click_link "Sign out"
    sign_up("user2@gmail.com")
    expect(page).not_to have_content("You have successfully logged in user: user1@gmail.com")
    expect(page).to have_content("You have successfully logged in user: user2@gmail.com")
  end

  scenario "A user can only sign out if they are signed in" do
    visit("/")
    expect(page).not_to have_link("Sign out")
  end

end
