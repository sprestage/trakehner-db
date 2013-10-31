require "test_helper"


feature "As a site owner, I want to sign up a new user" do
  scenario "new user is successfully created" do
    # Given a completed new user form
    visit new_user_registration_path
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: '12341234'
    fill_in 'Password confirmation', with: '12341234'
    # When I submit the form
    click_on 'Sign up'
    # Then I should see the new user created success message
    page.must_have_content "Welcome! You have signed up successfully"
    page.wont_have_content "prohibited this user from being saved"
  end

end
