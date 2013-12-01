require "test_helper"

feature "deleting a horse" do
  scenario "successfully delete horses" do
    # Given a horse
    sign_in
    visit horses_path
    page.text.must_include "A Buck An Hour"
    # When I submit the form
    page.find(:xpath, '//*[@id="1072768618"]').click_on "Destroy"
    # Then I should receive a warning
    page.has_content?('Are you sure')
    # And the horse is no longer present
    page.text.must_include "A Capella"
    page.text.must_include "A Bit Of Mozart"
    page.wont_have_content "A Buck An Hour"
  end

end

