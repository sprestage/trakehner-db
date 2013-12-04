require "test_helper"

feature "deleting a horse" do
  scenario "successfully delete horses" do
    # Given a horse
    sign_in_admin
    visit horses_path
    fill_in "search", with: "k"
    click_on "Search"
    page.text.must_include horses(:jakira).name
    page.text.must_include horses(:polarpunkt).name

    visit horse_path(horses(:polarpunkt))
    page.text.must_include "Polarpunkt"
    click_on "Edit"
    page.text.must_include "Editing horse"

    # When I submit the form
    click_on "Delete Horse"
    # Then I should receive a warning
    page.has_content?('Are you sure')

    visit horses_path
    fill_in "search", with: "k"
    click_on "Search"

    # And the horse is no longer present
    page.text.must_include horses(:jakira).name
    page.wont_have_content horses(:polarpunkt).name
  end

end
