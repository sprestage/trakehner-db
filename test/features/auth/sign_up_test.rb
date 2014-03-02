require "test_helper"

feature "As a visitor, I shouldn't be offered the chance to create a new user account myself" do

  scenario "visitor can't see new user creation link in sign-in page" do
    visit new_user_session_path
    page.wont_have_content "Sign up"
  end

  scenario "visitor can't visit create new user page via direct URL" do
    # How would we test this?  The route doesn't exist.
  end

end
