require 'rails_helper'

RSpec.feature "Update my posts", type: :feature do
  scenario "User tries to update post more than 10 mins after creation" do
    sign_up
    click_link "View Your Posts"
    create_a_post("Hello")
    click_link "Edit"
    post_creation_date = Post.find(1).created_at
    p "Post Creation date"
    p post_creation_date
    eleven_mins_in_seconds = 660
    allow(Time).to receive(:now) {post_creation_date + eleven_mins_in_seconds}
    p "Time now after stubbing"
    p time_after =Time.now
    p time_after > post_creation_date
    p time_after < post_creation_date

    expect(page).to have_content("You can no longer update this post")
  end
end
