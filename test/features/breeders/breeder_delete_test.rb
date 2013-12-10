require "test_helper"

feature "deleting a breeder" do
  scenario "successfully delete breeders" do
    # Given a breeder
    sign_in_admin
    visit breeders_path
    page.text.must_include breeders(:tabarah).name
    page.text.must_include breeders(:breeder02).name

    # When I submit the form
    visit breeders_path
    page.click_on("Second Breeder")
    click_on "Edit"
    page.text.must_include "Editing breeder"
    click_on "Delete Breeder"
    # Then I should receive a warning
    page.has_content?('Are you sure')

    # And the breeder is no longer present
    visit breeders_path
    page.text.must_include breeders(:tabarah).name
    page.wont_have_content breeders(:breeder02).name
  end

  scenario "admin successfully sees the Delete Breeder link" do
    # Given a signed in admin
    sign_in_admin
    # When the breeder edit page is visited
    visit breeders_path
    page.click_on("Second Breeder")
    click_on "Edit"
    # Then the delete breeder link is present
    page.text.must_include "Delete Breeder"
  end

  scenario "non-admin successfully fails to see the Delete Breeder link" do
    # Given a not-signed-in site visitor
        # do nothing
    # When the breeder edit page is visited
    visit breeders_path
    page.click_on("Second Breeder")
    # Then the edit breeder link is absent,
    #  which means we cannot get to the delete breeder link
    page.wont_have_content "Edit Breeder"
  end

end
