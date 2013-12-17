require "test_helper"

feature "Show horse index" do
  scenario "site visitor successfully sees all horses in the index" do
    # Given existing horses
    # When I visit the horses path
    visit horses_path
    # Then I should see all horses
    page.text.must_include horses(:abdullah).name
    page.text.must_include horses(:abiza).name
  end

  scenario "logged in admin also successfully sees all horses in the index" do
    sign_in_admin
    # Given existing horses
    # When I visit the horses path
    visit horses_path
    # Then I should see pagination links and only see the first 25 horses alphabetically
    page.text.must_include horses(:abdullah).name
    page.text.must_include horses(:abiza).name
  end

  scenario "successfully see pagination of horses in the index" do
    # Given existing horses
    # When I visit the horses path
    visit horses_path
    # Then I should see pagination links and only see the first 25 horses alphabetically
    page.text.must_include "Next"
    page.text.must_include "Last"
    page.wont_have_content horses(:zzz).name
  end

  scenario "successfully follow pagination of horses in the index" do
    # Given existing horses
    # When I visit the horses path, I only see the first 25 horses alphabetically
    visit horses_path
    page.text.must_include horses(:abdullah).name
    page.wont_have_content horses(:zzz).name
    # Then follow pagination link and only see the next 25 horses alphabetically
    click_on "Next"
    page.text.must_include horses(:zzz).name
    page.wont_have_content horses(:abdullah).name
  end

end

