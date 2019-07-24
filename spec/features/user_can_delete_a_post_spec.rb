require 'rails_helper'

RSpec.feature "Delete a post", type: :feature do
  scenario "when you click on delete, post is removed from your page" do
    sign_up
    click_link "View Your Posts"
    create_a_post("I love monsieur Travis")
    expect(page).to have_content("I love monsieur Travis")
    click_link "Delete"
    expect(page).to have_current_path("/users/1/posts")
    expect(page).not_to have_content("I love monsieur Travis")
  end
end
