require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/users/sign_in"

    click_link "Sign up"
    fill_in("Email", :with => "user@gmail.com")
    fill_in("Password", :with => "123456")
    fill_in("Password confirmation", :with => "123456")
    click_button "Sign up"

    visit "/posts"

    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
end
