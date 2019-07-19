require 'rails_helper'

RSpec.feature "View my posts", type: :feature do
  scenario "User logs in and visit their posts" do

    visit "/users/sign_in"
    click_link "Sign up"
    fill_in("Email", :with => "user@gmail.com")
    fill_in("Password", :with => "123456")
    fill_in("Password confirmation", :with => "123456")
    click_button "Sign up"

    expect(current_path).to eq("/")
    expect(page).to have_content("You have successfully logged in user: user@gmail.com")
    click_link "View Your Posts"

    expect(current_path).to eq("/users/1/posts")
    expect(page).to have_content("Your posts:")
  end
end
