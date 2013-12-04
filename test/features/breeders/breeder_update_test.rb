require "test_helper"

feature "Update Breeder" do
  scenario "successfully update breeder" do
    # Given an existing breeder
    sign_in_admin
    visit breeder_path(breeders(:breeder01))
    page.text.must_include 'Edit'
    click_on 'Edit'
    fill_in 'Name', with: "Fourth Breeder"
    # When I click edit and submit changed data
    click_on 'Update Breeder'
    # Then I should see the updated breeder
    page.text.must_include "Fourth Breeder"
    # And a success message
    page.text.must_include 'Breeder was successfully updated'
  end

  scenario "fail to update breeder, validation errror, name presence" do
    # Given an existing breeder
    sign_in_admin
    visit breeder_path(breeders(:breeder02))
    page.text.must_include 'Edit'
    click_on 'Edit'
    fill_in 'Name', with: ""
    # When I click edit and submit changed data
    click_on 'Update Breeder'
    # Then I should see failure message
    page.text.must_include "Name can't be blank"
    # and no updated breeder or success message
    page.wont_have_content "Breeder was successfully updated"
  end

  scenario "fail to update breeder, failed validation, name uniqueness" do
    # Given an existing breeder
    sign_in_admin
    visit breeder_path(breeders(:breeder02))
    page.text.must_include 'Edit'
    click_on 'Edit'
    fill_in "Name", with: breeders(:breeder03).name
    # When the form is submitted
    click_on "Update Breeder"
    # Then I should see failure message
    page.text.must_include "Name has already been taken"
    # and no updated breeder or success message
    page.wont_have_content "Breeder was successfully created"
  end

end
