require "test_helper"

feature "deleting a horse" do
  scenario "successfully delete horses" do
    # Given a horse
    visit horses_path
    # When I submit the form
    page.find(:xpath, '//*[@id="page-content-wrapper"]/div/div/div/div/div/table/tbody/tr[4]').click_on "Destroy"
    # Then I should receive a warning
    page.has_content?('Are you sure')
    # And the horse is no longer present
    page.text.must_include horses(:horse01).name
    page.text.must_include horses(:horse02).name
    page.wont_have_content "Last Horse"
  end

end

