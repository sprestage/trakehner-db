require "test_helper"

feature "deleting a breeder" do
  scenario "successfully delete breeders" do
    # Given a breeder
    sign_in
    visit breeders_path
    fill_in "search_name", with: "Tabarah"
    click_on "Search Breeder By Name"

    page.text.must_include "Tabarah"
    # When I submit the form
    page.find(:xpath, '//*[@id="242306113"]').click_on "Delete Breeder"
    # Then I should receive a warning
    page.has_content?('Are you sure')

    visit breeders_path
    fill_in "search_name", with: "Tabarah"
    click_on "Search Breeder By Name"

    # And the breeder is no longer present
    page.wont_have_content "Tabarah"
  end

end
