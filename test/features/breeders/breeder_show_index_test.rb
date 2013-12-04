require "test_helper"

feature "Show breeder index" do
  scenario "site visitor successfully see all breeders in the index" do
    # Given existing breeders
    # When I visit the breeders path
    visit breeders_path
    # Then I should see all breeders
    page.text.must_include breeders(:meadowview).name
    page.text.must_include breeders(:blessed_fields).name
  end

  scenario "logged in admin also successfully see all breeders in the index" do
    sign_in_admin
    # Given existing breeders
    # When I visit the breeders path
    visit breeders_path
    # Then I should see all breeders
    page.text.must_include breeders(:meadowview).name
    page.text.must_include breeders(:blessed_fields).name
  end

end

