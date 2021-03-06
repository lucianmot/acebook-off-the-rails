require 'rails_helper'

RSpec.feature "When the user vists the index page", type: :feature do

  scenario "they should see the title" do
    visit "/"
    expect(page).to have_content("Welcome to Acebook")
  end

  scenario "they should be able to click sign up" do
    visit "/"
    click_button "Sign up"
    expect(current_path).not_to eq("/")
    expect(current_path).to eq("/users/sign_up")
  end

  scenario "they should be able to click log in" do
    visit "/"
    click_button "Sign in"
    expect(current_path).not_to eq("/")
    expect(current_path).to eq("/users/sign_in")
  end

end
