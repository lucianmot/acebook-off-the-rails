require 'rails_helper'

RSpec.feature "When the User isn't logged in", type: :feature do
  scenario "they should be redirected if they try to go to a page" do
    visit "users/1/posts"
    expect(page).to have_content("Log in")
  end
end
