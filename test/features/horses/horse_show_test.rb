require "test_helper"

feature "Show a single horse" do
  scenario "successfully see any single horse" do
    # Given an existing horse
    # When I visit the show single horse page
    visit horse_path(horses(:horse01))
    # Then I see details for a horse.
    page.text.must_include horses(:horse01).name
    page.wont_have_content horses(:horse02).name
  end

end

