require "test_helper"

feature "Show a single breeder" do

  scenario "successfully see Tabarah Ranch and parts of the address" do
    sign_in
    visit breeder_path(breeders(:tabarah))

    page.text.must_include breeders(:tabarah).name
    page.text.must_include breeders(:tabarah).address

    page.wont_have_content breeders(:meadowview).name
    page.wont_have_content "Unknown"
  end

end
