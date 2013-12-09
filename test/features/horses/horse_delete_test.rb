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

    visit horse_path(horses(:polarpunkt).id)
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

  scenario "admin successfully sees the Delete Horse link" do
    # Given a signed in admin
    sign_in_admin
    # When the horse edit page is visited
    visit horse_path(horses(:horse02).id)
    click_on "Edit"
    # Then the delete horse link is present
    page.text.must_include "Delete Horse"
  end

  scenario "non-admin successfully fails to see the Delete Horse link" do
    # Given a not-signed-in site visitor
        # do nothing
    # When the horse edit page is visited
    visit horse_path(horses(:horse02).id)
    # Then the edit horse link is absent,
    #  which means we cannot get to the delete horse link
    page.wont_have_content "Edit Horse"
  end

end
