require "test_helper"

feature "Show breeder index" do
  scenario "successfully see all breeders in the index" do
    # Given existing breeders
    # When I visit the breeders path
    visit breeders_path
    # Then I should see all breeders
    page.text.must_include breeders(:meadowview).name
    page.text.must_include breeders(:blessed_fields).name
  end

end

