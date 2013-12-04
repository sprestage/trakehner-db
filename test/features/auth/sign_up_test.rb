require "test_helper"

feature "As a visitor, I want to sign up as a new user so I can create and edit content." do
  scenario "new account is successfully created from root_path" do
    # Given a completed new user form
    visit "/about"
    click_on 'Sign Up'
    # When I submit the form with valid data
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: '12341234'
    fill_in 'Password confirmation', with: '12341234'
    click_on 'Sign up'
    # Then I should see the new user created success message
    page.must_have_content "Logged in as"
    page.must_have_content "Sign Out"
    page.wont_have_content "prohibited this user from being saved"
    page.wont_have_content "Sign up"
  end

  scenario "new account is successfully created from new_user_registration_path" do
    # Given a completed new user form
    visit new_user_registration_path
    # When I submit the form with valid data
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: '12341234'
    fill_in 'Password confirmation', with: '12341234'
    click_on 'Sign up'
    # Then I should see the new user created success message
    page.must_have_content "Logged in as"
    page.must_have_content "Sign Out"
    page.wont_have_content "prohibited this user from being saved"
    page.wont_have_content "Sign up"
  end
end
