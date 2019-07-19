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

  scenario "User password is more than 10 characters" do
    visit "/users/sign_up"
    fill_in "user_email", with: "example@gmail.com"
    fill_in "user_password", with: "1234567891011"
    fill_in "user_password_confirmation", with: "1234567891011"
    click_button "Sign up"
    expect(current_path).to eq("/users")
    expect(page).to have_content("Password is too long (maximum is 10 characters)")
  end

  scenario "User password is the correct length" do
    visit "/users/sign_up"
    fill_in "user_email", with: "example@gmail.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_button "Sign up"
    expect(current_path).to eq("/")
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario "User password field is empty" do
    visit "/users/sign_up"
    fill_in "user_email", with: "example@gmail.com"
    click_button "Sign up"
    expect(current_path).to eq("/users")
    expect(page).to have_content("Password can't be blank")
  end
end
# testing password that is too short - done
# testing password that is too long - done
# testing when password is correct length, user is signed up - done
# tesing no password typed in - right error message received - done
# testing the right error message when the password confirmation not filled in
# testing not matching passwords
