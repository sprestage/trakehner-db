require "test_helper"

feature "Update Horse" do
  scenario "admin successfully updates horse" do
    # Given an existing horse
    sign_in_admin
    visit horses_path
    page.click_on("First horse")
    page.text.must_include 'Edit'
    click_on 'Edit'
    fill_in 'Name', with: "First horse"
    # When I click edit and submit changed data
    click_on 'Update Horse'
    # Then I should see the updated horse
    page.text.must_include "First horse".upcase
    # And a success message
    page.text.must_include 'Horse was successfully updated'
  end

  scenario "ata successfully updates horse" do
    # Given an existing horse
    sign_in_ata
    visit horses_path
    page.click_on("First horse")
    page.text.must_include 'Edit'
    click_on 'Edit'
    fill_in 'Name', with: "First horse"
    # When I click edit and submit changed data
    click_on 'Update Horse'
    # Then I should see the updated horse
    page.text.must_include "First horse".upcase
    # And a success message
    page.text.must_include 'Horse was successfully updated'
  end

  scenario "fail to update horse, validation errror, name presence" do
    # Given an existing horse
    sign_in_admin
    visit horses_path
    page.click_on("First horse")
    page.text.must_include 'Edit'
    click_on 'Edit'
    fill_in 'Name', with: ""
    # When I click edit and submit changed data
    click_on 'Update Horse'
    # Then I should see failure message
    page.text.must_include "Please review the problems below"
    page.text.must_include "can't be blank"
    # and no success message
    page.wont_have_content "Horse was successfully updated"
    # and stilll on edit page instead of show page
    page.text.must_include "Editing horse"
  end

  scenario "fail to update horse, failed validation, name uniqueness" do
    # Given an existing horse
    sign_in_admin
    visit horses_path
    page.click_on("First horse")
    page.text.must_include 'Edit'
    click_on 'Edit'
    fill_in "Name", with: horses(:horse04).name
    # When the form is submitted
    click_on "Update Horse"
    # Then I should see failure message
    page.text.must_include "Please review the problems below"
    page.text.must_include "has already been taken"
    # and no success message
    page.wont_have_content "Horse was successfully updated"
    # and stilll on edit page instead of show page
    page.text.must_include "Editing horse"
  end

  scenario "admin successfully sees the Edit Horse link" do
    # Given a signed in admin
    sign_in_admin
    # When the horse edit page is visited
    visit horses_path
    page.click_on("First horse")
    click_on "Edit"
    # Then the delete horse link is present
    page.text.must_include "Editing horse"
  end

  scenario "non-admin successfully fails to see the Edit Horse link" do
    # Given a not-signed-in site visitor
        # do nothing
    # When the horse edit page is visited
    visit horses_path
    page.click_on("First horse")
    # Then the edit horse link is absent,
    #  which means we cannot get to the delete horse link
    page.wont_have_content "Edit Horse"

  end

end
