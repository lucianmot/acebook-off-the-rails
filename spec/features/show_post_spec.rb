require 'rails_helper'

RSpec.feature "Show Post", type: :feature do
  scenario "User can see full text of the single post" do
    sign_up
    click_link "View Your Posts"
    create_a_post("Hello")
    click_link "View All Posts"
    expect(current_path).to eq("/posts")
    expect(page).to have_content("Hello")
    click_button "Show"
    expect(current_path).to eq("/post/1")
    expect(page).to have_content("Hello")
  end
end
