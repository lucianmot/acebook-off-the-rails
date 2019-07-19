require 'rails_helper'

RSpec.feature 'Sign-in email', type: :feature do
  scenario "user enter blank password with valid e-mail" do
    # sign_up
    visit("/")
    click_button "Sign in"
    fill_in('Email', :with => 'user@gmail.com')
    click_button "Sign In"
    expect(page).to have_content("Invalid Email or password.")
  end
end
