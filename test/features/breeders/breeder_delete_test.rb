require "test_helper"

feature "deleting a breeder" do
  scenario "successfully delete breeders" do
    # Given a breeder
    sign_in_admin
    visit breeders_path
    page.text.must_include breeders(:tabarah).name
    page.text.must_include breeders(:breeder02).name

    # When I submit the form
    visit breeder_path(breeders(:breeder02))
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

end
