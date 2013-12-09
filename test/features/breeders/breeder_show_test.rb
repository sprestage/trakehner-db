require "test_helper"

feature "Show a single breeder" do

  scenario "site visitor successfully sees Tabarah Ranch and parts of the address" do
    visit breeder_path(breeders(:tabarah).id)

    page.text.must_include breeders(:tabarah).name
    page.text.must_include breeders(:tabarah).address

    page.wont_have_content breeders(:meadowview).name
    page.wont_have_content "Unknown"
  end

  scenario "logged in admin also successfully sees Tabarah Ranch and parts of the address" do
    sign_in_admin
    visit breeder_path(breeders(:tabarah).id)

    page.text.must_include breeders(:tabarah).name
    page.text.must_include breeders(:tabarah).address

    page.wont_have_content breeders(:meadowview).name
    page.wont_have_content "Unknown"
  end

end
