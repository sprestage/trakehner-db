require "test_helper"

feature "Create horse" do
  scenario "successfully create horses" do
    # Given a completed new horse form
    sign_in
    visit new_horse_path
    fill_in "Name", with: horses(:horse04).name
    # When the form is submitted
    click_on "Create Horse"
    # Then a new horse should be created and displayed
    page.text.must_include "Horse was successfully created"
    page.text.must_include horses(:horse04).name
  end

end



