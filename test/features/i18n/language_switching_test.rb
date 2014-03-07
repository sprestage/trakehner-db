require "test_helper"

feature "Langage switching" do
  scenario "Swaps between languages" do
    visit root_path
    page.must_have_content "The Unofficial Trakehner Database"
    click_on 'Deutsche'
    page.must_have_content "Der Inoffiziell Trakehner Datenbank"
    page.must_have_content "Pferde"
    click_on 'English'
    page.must_have_content "The Unofficial Trakehner Database"
    page.must_have_content "Horses"
  end
end
