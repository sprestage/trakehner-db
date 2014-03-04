# ruby -Itest test/features/auth/sign_out_test.rb

require "test_helper"

feature "As a visitor, I want to sign out when I'm done." do
  scenario "signed in user is successfully signed out" do
    # Given a user is logged in
    visit new_user_session_path
    fill_in 'Email', with: users(:user_one).email
    fill_in 'Password', with: 'password'
    click_on 'Sign in'
    page.must_have_content "Logged in as"
    page.must_have_content "Sign Out"
    page.wont_have_content "Invalid email or password"
    page.wont_have_content "Sign In"
    # When I click log out.
    page.find(:xpath, '//*[@id="sign_in_out_div"]').click_on("Sign Out")
    # Then I should see the logged out message
    page.text.must_include "Sign In"
    page.wont_have_content "Sign Out"
  end

end
