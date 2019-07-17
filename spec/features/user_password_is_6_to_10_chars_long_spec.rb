require 'rails_helper'

RSpec.feature "Sign-up password", type: :feature do
  scenario "User password is less than 6 characters" do
    visit "/users/sign_up"
    fill_in "user_email", with: "example@gmail.com"
    fill_in "user_password", with: "1234"
    fill_in "user_password_confirmation", with: "1234"
    click_button "Sign up"
    expect(current_path).to eq("/users")
    expect(page).to have_content("Password is too short (minimum is 6 characters)")
  end
end
