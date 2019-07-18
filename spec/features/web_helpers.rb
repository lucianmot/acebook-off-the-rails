def sign_up
   visit "/users/sign_in"
    click_link "Sign up"
    fill_in("Email", :with => "user@gmail.com")
    fill_in("Password", :with => "123456")
    fill_in("Password confirmation", :with => "123456")
    click_button "Sign up"
end