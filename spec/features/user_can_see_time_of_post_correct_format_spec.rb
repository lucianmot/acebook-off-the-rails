require 'rails_helper'

RSpec.feature "User posts", type: :feature do
  scenario "have correct formatting" do
    sign_up("user@gmail.com", "123456")
    click_link "View Your Posts"
    click_link "New post"
    fill_in("post_message", with: "Hello")
    click_button "Submit"
    post_creation_date = Post.find(1).created_at
    formatted_date = post_creation_date.strftime("%d %B %Y %H:%M")

    expect(current_path).to eq("/users/1/posts")
    expect(page).to have_content("Hello")
    expect(page).to have_content(formatted_date)
  end
end
