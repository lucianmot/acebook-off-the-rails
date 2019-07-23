def sign_up(mail = "user@gmail.com", pass = "123456")
  visit "/users/sign_in"
  click_link "Sign up"
  fill_in("Email", :with => mail)
  fill_in("Password", :with => pass)
  fill_in("Password confirmation", :with => pass)
  click_button "Sign up"
end

def sign_up_with_sign_out
  sign_up
  click_link "Sign out"
  click_button "Sign in"
end

def create_a_post(message)
  click_link "New post"
  fill_in("post_message", with: message)
  click_button "Submit"
end
