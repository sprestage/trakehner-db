require "test_helper"

feature "Search for horses using the search bar" do

  scenario "Search for a string that doesn't give any horses" do
    visit root_path
    fill_in "search", with: "armadillo"
    click_on "Search"

    # No horse results means no editing actions for a horse
    page.wont_have_content "Edit"
    page.wont_have_content "Destroy"

  end

  scenario "Search for empty string (should match all horses)" do
    visit root_path
    fill_in "search", with: ""
    click_on "Search"

    page.text.must_include horses(:abiza).name
    page.text.must_include horses(:abdullah).name
    page.text.must_include horses(:arogno).name
  end

  scenario "Search for some horses" do
    visit root_path
    fill_in "search", with: "J"
    click_on "Search"

    page.text.must_include horses(:jaegerin).name
    page.text.must_include horses(:jamilah).name
    page.wont_have_content horses(:nemo).name
    page.wont_have_content horses(:siegel).name
  end

end

