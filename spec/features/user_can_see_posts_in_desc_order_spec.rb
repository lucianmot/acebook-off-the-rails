require 'rails_helper'

RSpec.feature "When the User views their posts", type: :feature do
  scenario "they should be in descending order - newest first" do
    sign_up("user@gmail.com", "123456")
    click_link "View Your Posts"
    
    create_a_post("First Post")    
    create_a_post("Second Post")     
    create_a_post("Third Post")   

    expect(page).to have_text(/Third Post .+ Second Post .+ First Post/)   
  end
end
