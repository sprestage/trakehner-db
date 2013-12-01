require "test_helper"

feature "deleting a horse" do
  scenario "successfully delete horses" do
    # Given a horse
    sign_in
    visit horses_path
    fill_in "search", with: "Nemo"
    click_on "Search"

    page.text.must_include "Nemo"
    # When I submit the form
    page.find(:xpath, '//*[@id="973029318"]').click_on "Delete Horse"
    # Then I should receive a warning
    page.has_content?('Are you sure')

    visit horses_path
    fill_in "search", with: "Nemo"
    click_on "Search"

    # And the horse is no longer present
    page.wont_have_content "Nemo"
  end

end