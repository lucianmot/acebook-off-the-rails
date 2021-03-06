require 'rails_helper'

RSpec.feature "When the User wants to sign-up", type: :feature do
  scenario "they should know that the email has correct format" do
    visit "/users/sign_up"
    fill_in "user_email", with: "example"
    fill_in "user_password", with: "1234567"
    fill_in "user_password_confirmation", with: "1234567"
    click_button "Sign up"
    expect(current_path).to eq("/users")
    expect(page).to_not have_content("Welcome! You have signed up successfully.")
  end

  scenario "they should know that the email is unique" do
    sign_up("user@gmail.com", "123456")
    click_link "Sign out"
    click_button "Sign up"
    fill_in("Email", :with => "user@gmail.com")
    fill_in("Password", :with => "123456")
    fill_in("Password confirmation", :with => "123456")
    click_button "Sign up"
    expect(current_path).to eq("/users")
    expect(page).to have_content("Email has already been taken")
  end

  scenario "they should get an error if email is blank but password and password confirmation match" do
    visit "/users/sign_up"
    fill_in "user_email", with: ""
    fill_in "user_password", with: "1234567"
    fill_in "user_password_confirmation", with: "1234567"
    click_button "Sign up"
    expect(current_path).to eq("/users")
    expect(page).to have_content("Email can't be blank")
  end

  scenario "they should get an error if User email, password and password confirmation are blank" do
    visit "/users/sign_up"
    fill_in "user_email", with: ""
    fill_in "user_password", with: ""
    fill_in "user_password_confirmation", with: ""
    click_button "Sign up"
    expect(current_path).to eq("/users")
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
  end

  scenario "they should get an error if User email is blank and password and password confirmation do not match" do
    visit "/users/sign_up"
    fill_in "user_email", with: ""
    fill_in "user_password", with: "1234567"
    fill_in "user_password_confirmation", with: "12345678"
    click_button "Sign up"
    expect(current_path).to eq("/users")
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end
