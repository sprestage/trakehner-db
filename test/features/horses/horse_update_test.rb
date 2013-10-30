require "test_helper"

feature "updating a horse" do
  scenario "editor can successfully update horses" do
    # Given an existing horse
    visit horse_path(horses(:horse02))
    click_on 'Edit'
    fill_in 'Name', with: "Second Horse"
    # When I click edit and submit changed data
    click_on 'Update Horse'
    # Then I should see the updated horse
    page.text.must_include "Second Horse"
    # And a success message
    page.text.must_include 'Horse was successfully updated'
  end

end
