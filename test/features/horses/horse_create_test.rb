require "test_helper"

feature "Create horse" do
  scenario "successfully create horses" do
    # Given a completed new horse form
    sign_in_admin
    visit new_horse_path
    fill_in "Name", with: "Jupiter"
    # When the form is submitted
    click_on "Create Horse"
    # Then a new horse should be created and displayed
    page.text.must_include "Horse was successfully created"
    page.text.must_include "Jupiter".upcase
  end

  scenario "fail to create horse due to failed validation, name presence" do
    # Given a completed new horse form
    sign_in_admin
    visit new_horse_path
    # When the form is submitted
    click_on "Create Horse"
    # Then a new horse should be created and displayed
    page.text.must_include "Name can't be blank"
    page.wont_have_content "Horse was successfully created"
  end

  scenario "fail to create horse, failed validation, name uniqueness" do
    # Given a completed new horse form
    sign_in_admin
    visit new_horse_path
    fill_in "Name", with: horses(:horse04).name
    # When the form is submitted
    click_on "Create Horse"
    # Then a new horse should be created and displayed
    page.text.must_include "Name has already been taken"
    page.wont_have_content "Horse was successfully created"
    page.wont_have_content horses(:horse04).name
  end

end



