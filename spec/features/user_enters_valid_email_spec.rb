require 'rails_helper'

RSpec.feature 'Sign-in email', type: :feature do
  scenario "user enter blank password with valid e-mail" do
    sign_up_with_sign_out
    fill_in('Email', :with => 'user@gmail.com')
    click_button "Log in"
    expect(page).to have_content("Invalid Email or password.")
  end

  scenario "user enter blank password and blank e-mail" do
    sign_up_with_sign_out
    click_button "Log in"
    expect(page).to have_content("Invalid Email or password.")
  end

  scenario "user enter blank e-mail with valid password" do
    sign_up_with_sign_out
    fill_in('Password', :with => '123456')
    click_button "Log in"
    expect(page).to have_content("Invalid Email or password.")
  end

  scenario "user enter valid e-mail with incorrect password" do
    sign_up_with_sign_out
    fill_in('Email', :with => 'user@gmail.com')
    fill_in('Password', :with => '9876543')
    click_button "Log in"
    expect(page).to have_content("Invalid Email or password.")
  end

  scenario "user enter valid password with incorrect e-mail" do
    sign_up_with_sign_out
    fill_in('Email', :with => 'user@gmail.co.uk')
    fill_in('Password', :with => '123456')
    click_button "Log in"
    expect(page).to have_content("Invalid Email or password.")
  end
end
