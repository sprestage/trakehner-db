require "test_helper"

feature "Search for breeders on the index page" do

  scenario "Search for a string in the name that doesn't give any breeders" do
    sign_in
    visit breeders_path
    fill_in "search_name", with: "who's this"
    click_on "Search Breeder By Name"

    # No breeder results means no editing actions for a breeder
    page.wont_have_content "Edit"
    page.wont_have_content "Destroy"

  end

  # scenario "Search for a string in the address that doesn't give any breeders" do
  #   sign_in
  #   visit breeders_path
  #   fill_in "search_address", with: "where's this"
  #   click_on "Search Breeder By Address"

  #   # No breeder results means no editing actions for a breeder
  #   page.wont_have_content "Edit"
  #   page.wont_have_content "Destroy"
  # end

  scenario "Search for empty name string (should match all breeders)" do
    visit breeders_path
    fill_in "search_name", with: ""
    click_on "Search Breeder By Name"

    page.text.must_include breeders(:tabarah).name
    page.text.must_include breeders(:meadowview).name
    page.text.must_include breeders(:blessed_fields).name
  end

  scenario "Search for empty address string (should match all breeders)" do
    visit breeders_path
    fill_in "search_address", with: ""
    click_on "Search Breeder By Address"

    page.text.must_include breeders(:tabarah).address
    page.text.must_include breeders(:meadowview).address
    page.text.must_include breeders(:blessed_fields).address
  end

  scenario "Search for some breeders by name" do
    visit breeders_path
    fill_in "search_name", with: "t"
    click_on "Search Breeder By Name"

    page.text.must_include breeders(:tabarah).name
    page.text.must_include breeders(:breeder01).name
    page.wont_have_content breeders(:meadowview).name
    page.wont_have_content breeders(:blessed_fields).name
  end

  scenario "Site visitor can successsfully search for some breeders by name" do
    visit breeders_path
    fill_in "search_name", with: "t"
    click_on "Search Breeder By Name"

    page.text.must_include breeders(:tabarah).name
    page.text.must_include breeders(:breeder01).name
    page.wont_have_content breeders(:meadowview).name
    page.wont_have_content breeders(:blessed_fields).name
  end

  scenario "Logged in admin can also successsfully search for some breeders by name" do
    sign_in_admin
    visit breeders_path
    fill_in "search_name", with: "t"
    click_on "Search Breeder By Name"

    page.text.must_include breeders(:tabarah).name
    page.text.must_include breeders(:breeder01).name
    page.wont_have_content breeders(:meadowview).name
    page.wont_have_content breeders(:blessed_fields).name
  end

  # scenario "Search for some breeders by address" do
  #   visit breeders_path
  #   fill_in "search_address", with: "v"
  #   click_on "Search Breeder By Address"

  #   page.text.must_include breeders(:tabarah).address
  #   page.text.must_include breeders(:blessed_fields).address
  #   page.wont_have_content breeders(:meadowview).address
  #   page.wont_have_content breeders(:breeder01).address
  # end

end

