require "test_helper"

feature "Create breeder" do
  scenario "successfully create breeders" do
    # Given a completed new breeder form
    sign_in_admin
    visit new_breeder_path
    fill_in "Name", with: "Hopeful Farm"
    # When the form is submitted
    click_on "Create Breeder"
    # Then a new breeder should be created and displayed
    page.text.must_include "Breeder was successfully created"
    page.text.must_include "Hopeful Farm"
  end

  scenario "fail to create breeder due to failed validation, name presence" do
    # Given a completed new breeder form
    sign_in_admin
    visit new_breeder_path
    # When the form is submitted
    click_on "Create Breeder"
    # Then a new breeder should be created and displayed
    page.text.must_include "Name can't be blank"
    page.wont_have_content "Breeder was successfully created"
  end

  scenario "fail to create breeder, failed validation, name uniqueness" do
    # Given a completed new breeder form
    sign_in_admin
    visit new_breeder_path
    fill_in "Name", with: breeders(:tabarah).name
    # When the form is submitted
    click_on "Create Breeder"
    # Then a new breeder should be created and displayed
    page.text.must_include "Name has already been taken"
    page.wont_have_content "Breeder was successfully created"
    page.wont_have_content breeders(:tabarah).name
  end

end



