require "test_helper"

feature "Update Horse" do
  scenario "successfully update horse" do
    # Given an existing horse
    sign_in_admin
    visit horse_path(horses(:horse02))
    page.text.must_include 'Edit'
    click_on 'Edit'
    fill_in 'Name', with: "Second Horse"
    # When I click edit and submit changed data
    click_on 'Update Horse'
    # Then I should see the updated horse
    page.text.must_include "Second Horse".upcase
    # And a success message
    page.text.must_include 'Horse was successfully updated'
  end

  scenario "fail to update horse, validation errror, name presence" do
    # Given an existing horse
    sign_in_admin
    visit horse_path(horses(:horse02))
    page.text.must_include 'Edit'
    click_on 'Edit'
    fill_in 'Name', with: ""
    # When I click edit and submit changed data
    click_on 'Update Horse'
    # Then I should see failure message
    page.text.must_include "Name can't be blank"
    # and no success message
    page.wont_have_content "Horse was successfully updated"
    # and stilll on edit page instead of show page
    page.text.must_include "Editing horse"
  end

  scenario "fail to update horse, failed validation, name uniqueness" do
    # Given an existing horse
    sign_in_admin
    visit horse_path(horses(:horse02))
    page.text.must_include 'Edit'
    click_on 'Edit'
    fill_in "Name", with: horses(:horse04).name
    # When the form is submitted
    click_on "Update Horse"
    # Then I should see failure message
    page.text.must_include "Name has already been taken"
    # and no success message
    page.wont_have_content "Horse was successfully updated"
    # and stilll on edit page instead of show page
    page.text.must_include "Editing horse"
  end

end
