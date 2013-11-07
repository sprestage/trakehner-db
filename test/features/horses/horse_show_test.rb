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

  # Regression test: for a brief moment, the links in a horse's pedigree
  # to the horses listed there would lead back to the horse who's pedigree
  # it was (aka the horse being displayed), rather than to the page of the
  # horse named in the link
  scenario "Horses in pedigree have correct link in their href" do
    sign_in
    visit horse_path(horses(:polarpunkt))

    click_on horses(:arogno).name

    page.wont_have_content horses(:polarpunkt).name
  end

end
