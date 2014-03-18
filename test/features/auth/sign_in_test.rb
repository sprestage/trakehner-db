require "test_helper"

feature "As a visitor, I want to sign into my existing account." do
  scenario "existing account successfully logged in" do
    # Given an existing user
    visit new_user_session_path
    fill_in 'Email', with: users(:user_one).email
    fill_in 'Password', with: "password"  # NOTE: this gave me some trouble, since I tried to use fixtures here
    # When I submit the form with valid existing user data
    find('#log_in_confirm_button').click_on 'Log In'
    # Then I should receive a successful login message
    # save_and_open_page
    page.must_have_content "Logged in as"
    page.must_have_content "Sign Out"
    page.wont_have_content "Log In"
    page.wont_have_content "Invalid email or password"
  end
end
