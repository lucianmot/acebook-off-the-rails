require 'rails_helper'

RSpec.feature "When the User wants to sign-up", type: :feature do
  scenario "they should get an error if password is less than 6 characters" do
    visit "/users/sign_up"
    fill_in "user_email", with: "example@gmail.com"
    fill_in "user_password", with: "1234"
    fill_in "user_password_confirmation", with: "1234"
    click_button "Sign up"
    expect(current_path).to eq("/users")
    expect(page).to have_content("Password is too short (minimum is 6 characters)")
  end

  scenario "they should get an error if password is more than 10 characters" do
    visit "/users/sign_up"
    fill_in "user_email", with: "example@gmail.com"
    fill_in "user_password", with: "1234567891011"
    fill_in "user_password_confirmation", with: "1234567891011"
    click_button "Sign up"
    expect(current_path).to eq("/users")
    expect(page).to have_content("Password is too long (maximum is 10 characters)")
  end

  scenario "they should get confirmation if password is the correct length" do
    visit "/users/sign_up"
    fill_in "user_email", with: "example@gmail.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_button "Sign up"
    expect(current_path).to eq("/")
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario "they should get an error if password field is empty" do
    visit "/users/sign_up"
    fill_in "user_email", with: "example@gmail.com"
    click_button "Sign up"
    expect(current_path).to eq("/users")
    expect(page).to have_content("Password can't be blank")
  end

  scenario "they should get an error if password confirmation field is empty" do
    visit "users/sign_up"
    fill_in "user_email", with: "example@gmail.com"
    fill_in "user_password", with: "1234567"
    click_button "Sign up"
    expect(current_path).to eq("/users")
    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  scenario "they should get an error if password field does not match password confirmation field" do
    visit "users/sign_up"
    fill_in "user_email", with: "example@gmail.com"
    fill_in "user_password", with: "1234567"
    fill_in "user_password_confirmation", with: "12345678"
    click_button "Sign up"
    expect(current_path).to eq("/users")
    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end
