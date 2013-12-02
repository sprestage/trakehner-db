require "test_helper"

feature "Show horse index" do
  scenario "successfully see all horses in the index" do
    # Given existing horses
    # When I visit the horses path
    visit horses_path
    # Then I should see all horses
    page.text.must_include "Abdullah"
    page.text.must_include "Abiza"
  end

  scenario "successfully see pagination of horses in the index" do
    # Given existing horses
    # When I visit the horses path
    visit horses_path
    # Then I should see pagination links and only see the first 25 horses alphabetically
    page.text.must_include "Next"
    page.text.must_include "Last"
    page.wont_have_content horses(:polarpunkt).name
  end

end

