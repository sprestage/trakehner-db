require "test_helper"

feature "deleting a horse" do
  scenario "successfully delete horses" do
    # Given a horse
    sign_in
    visit horses_path
    page.text.must_include "Nemo"
    # When I submit the form
    page.find(:xpath, '//*[@id="973029318"]').click_on "Destroy"
    # Then I should receive a warning
    page.has_content?('Are you sure')
    # And the horse is no longer present
    page.text.must_include horses(:horse01).name
    page.text.must_include horses(:horse02).name
    page.wont_have_content "Nemo"
  end

end

