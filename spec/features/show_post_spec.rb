require 'rails_helper'

RSpec.feature "When the user clicks on show post", type: :feature do
  scenario "they should see full text of the single post" do
    sign_up
    click_link "View Your Posts"
    create_a_post("Hello")
    click_link "View All Posts"
    expect(current_path).to eq("/posts")
    expect(page).to have_content("Hello")
    click_link "Show"
    expect(current_path).to eq("/users/1/posts/1")
    expect(page).to have_content("Hello")
    expect(page).to have_link("Back to All Posts")
  end
end
