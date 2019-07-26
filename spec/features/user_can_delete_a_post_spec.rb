require 'rails_helper'

RSpec.feature "When the User deletes a Post", type: :feature do
  scenario "they should not see it in their Posts page" do
    sign_up
    click_link "View Your Posts"
    create_a_post("I love monsieur Travis")
    expect(page).to have_content("I love monsieur Travis")
    click_link "Delete"
    expect(page).to have_current_path("/users/1/posts")
    expect(page).not_to have_content("I love monsieur Travis")
  end
end
