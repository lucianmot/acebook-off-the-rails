require 'rails_helper'

# As a user
# So that I can use the application securely
# I can log out of my account and receive a confirmation

RSpec.feature "When the User wants to log out", type: :feature do
  scenario "they should get a confirmation" do
    sign_up
    expect(page).to have_content("You have successfully logged in user: user@gmail.com")
    click_link "Sign out"
    expect(page).to have_content("Signed out successfully")
  end

  scenario "they should log out and a new User should logs in, becoming the current User" do
    sign_up("user1@gmail.com")
    expect(page).to have_content("You have successfully logged in user: user1@gmail.com")
    click_link "Sign out"
    sign_up("user2@gmail.com")
    expect(page).not_to have_content("You have successfully logged in user: user1@gmail.com")
    expect(page).to have_content("You have successfully logged in user: user2@gmail.com")
  end

  scenario "they should only be able to sign out if they are signed in" do
    visit("/")
    expect(page).not_to have_link("Sign out")
  end

end
