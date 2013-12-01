require "test_helper"

feature "Show horse index" do
  scenario "successfully see all horses in the index" do
    # Given existing horses
    # When I visit the horses path
    visit horses_path
    # Then I should see all horses
    page.text.must_include horses("A Capella").name
    page.text.must_include horses("A Bit Of Mozart").name
    # page.text.must_include horses(:horse01).name
    # page.text.must_include horses(:horse02).name
  end

end

