require 'rails_helper'

RSpec.feature "User posts", type: :feature do
  scenario "are in descending order - newest first" do
    sign_up("user@gmail.com", "123456")
    click_link "View Your Posts"
    # first post
    click_link "New post"
    fill_in("post_message", with: "First Post")
    click_button "Submit"
    # second post
    click_link "New post"
    fill_in("post_message", with: "Second Post")
    click_button "Submit"
    # third post
    click_link "New post"
    fill_in("post_message", with: "Third Post")
    click_button "Submit"

    expect(page).to have_text(/Third Post .+ Second Post .+ First Post/)   
 
  end
end
