require 'rails_helper'

RSpec.feature "User Authentication", type: :feature do
  scenario "User is redirected if not logged in" do
    visit "users/1/posts"
    expect(page).to have_content("Log in")
  end
end
