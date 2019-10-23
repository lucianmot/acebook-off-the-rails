require 'rails_helper'

RSpec.feature "When a User wants to update posts", type: :feature do

  scenario "they should not be able to update Posts more than 10 mins after creation" do
    sign_up
    click_link "View Your Posts"
    create_a_post("Hello")

    post_creation_date = Post.find(1).created_at
    eleven_mins_in_seconds = 660
    allow(Time).to receive(:now) { post_creation_date + eleven_mins_in_seconds }

    click_link "Edit"
    expect(page).to have_content("You can no longer update this post")
  end

  scenario "they should be able to update Post less than 10 mins after creation" do
    sign_up
    click_link "View Your Posts"
    create_a_post("Hello")
    click_link "Edit"
    expect(page).to have_content("UPDATE")
  end

end
