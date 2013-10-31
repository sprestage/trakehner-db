require "test_helper"

feature "As a site owner, I want to sign up a new user" do
  scenario "new user is successfully created" do
    # Given a completed new user form
    visit root_path
    click_on 'Sign Up'
    # When I submit the form with valid data
    # fill_in 'Email', with: 'user@example.com'
    # fill_in 'Password', with: '12341234'
    click_on 'Sign up'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: '12341234'
    fill_in 'Password confirmation', with: '12341234'
    click_on 'Sign up'
    # Then I should see the new user created success message
    page.must_have_content "Welcome! You have signed up successfully"
    page.wont_have_content "prohibited this user from being saved"
  end
end
