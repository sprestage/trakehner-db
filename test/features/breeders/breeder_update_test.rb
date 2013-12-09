require "test_helper"

feature "Update Breeder" do
  scenario "successfully update breeder" do
    # Given an existing breeder
    sign_in_admin
    visit breeder_path(breeders(:breeder01).id)
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
    visit breeder_path(breeders(:breeder02).id)
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
    visit breeder_path(breeders(:breeder02).id)
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

  scenario "admin successfully sees the Edit Breeder link" do
    # Given a signed in admin
    sign_in_admin
    # When the breeder edit page is visited
    visit breeder_path(breeders(:breeder02).id)
    click_on "Edit"
    # Then the edit breeder page comes up
    page.text.must_include "Editing breeder"
  end

  scenario "non-admin successfully fails to see the Edit Breeder link" do
    # Given a not-signed-in site visitor
        # do nothing
    # When the breeder edit page is visited
    visit breeder_path(breeders(:breeder02).id)
    # Then the edit breeder link is absent,
    #  which means we cannot get to the delete breeder link
    page.wont_have_content "Edit"
  end

end
