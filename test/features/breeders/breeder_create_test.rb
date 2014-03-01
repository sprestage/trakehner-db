require "test_helper"

feature "Create breeder" do
  scenario "admin successfully creates breeders" do
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

  scenario "ata successfully creates breeders" do
    # Given a completed new breeder form
    sign_in_ata
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

  scenario "admin successfully sees the New Breeder link" do
    # Given a signed in admin
    sign_in_admin
    # When the breeder index is visited
    visit breeders_path
    # Then the create breeder link is present
    page.text.must_include "New Breeder"
  end

  scenario "non-admin successfully fails to see the New Breeder link" do
    # Given a not-signed-in site visitor
        # do nothing
    # When the breeder index is visited
    visit breeders_path
    # Then the create breeder link is absent
    page.wont_have_content "New Breeder"
  end
end



