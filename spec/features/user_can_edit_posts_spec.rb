require 'rails_helper'

RSpec.feature "When a User edits a Post", type: :feature do
  scenario "they should be able to change the body of a Post" do
    sign_up
    click_link "View Your Posts"
    create_a_post("I love monsieur Travis")
    expect(page).to have_content("I love monsieur Travis")
    click_link "Edit"
    expect(page).to have_current_path("/users/1/posts/1/edit")
    fill_in('Message', :with => "I secretly hate Travis")
    click_button "Submit"
    expect(page).not_to have_content("I love monsieur Travis")
    expect(page).to have_content("I secretly hate Travis")
    expect(page).to have_current_path("/users/1/posts")
  end
end
