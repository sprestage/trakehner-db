require "test_helper"

feature "Show a single horse" do

  scenario "successfully see Jakira and parts of her pedigree" do
    sign_in
    visit horse_path(horses(:jakira))

    page.text.must_include horses(:jakira).name
    page.text.must_include horses(:ichiban).name
    page.text.must_include horses(:arogno).name

    page.wont_have_content horses(:abdullah).name
    page.wont_have_content "Unknown"
  end

  scenario "successfully see Abdullah and parts of his pedigree" do
    sign_in
    visit horse_path(horses(:abdullah))

    page.text.must_include horses(:abdullah).name
    page.text.must_include horses(:donauwind).name
    page.text.must_include horses(:abiza).name
    page.text.must_include "Unknown"

    page.wont_have_content horses(:thundersflame).name
    page.wont_have_content horses(:marduc).name
  end

end

