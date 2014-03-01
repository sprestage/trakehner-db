require "test_helper"

feature "Show a single horse" do

  scenario "site visitor successfully sees Jakira and parts of her pedigree" do
    visit horses_path
    page.click_on("Jakira")

    page.text.must_include horses(:jakira).name.upcase
    page.text.must_include horses(:ichiban).name
    page.text.must_include horses(:arogno).name

    page.wont_have_content horses(:abdullah).name.upcase
    page.wont_have_content "Unknown"
  end

  scenario "logged in admin also successfully see Jakira and parts of her pedigree" do
    sign_in_admin
    visit horses_path
    page.click_on("Jakira")

    page.text.must_include horses(:jakira).name.upcase
    page.text.must_include horses(:ichiban).name
    page.text.must_include horses(:arogno).name

    page.wont_have_content horses(:abdullah).name.upcase
    page.wont_have_content "Unknown"
  end

  scenario "logged in non-admin successfully see Joriah and parts of her pedigree" do
    sign_in
    visit horses_path
    page.click_on("Jakira")

    page.text.must_include horses(:jakira).name.upcase
    page.text.must_include horses(:ichiban).name
    page.text.must_include horses(:arogno).name

    page.wont_have_content horses(:abdullah).name.upcase
    page.wont_have_content "Unknown"
  end

  # Regression test: for a brief moment, the links in a horse's pedigree
  # to the horses listed there would lead back to the horse who's pedigree
  # it was (aka the horse being displayed), rather than to the page of the
  # horse named in the link
  scenario "Horses in pedigree have correct link in their href" do
    sign_in
    visit horses_path
    page.click_on("Polarpunkt")

    click_on horses(:arogno).name

    page.wont_have_content horses(:polarpunkt).name
    page.wont_have_content horses(:polarpunkt).name.upcase
  end

  scenario "A horses's progeny are successfully displayed" do
    # Given a horse has progeny
    visit horse_path(I18n.default_locale, horses(:jaegerin))
    # When visit the progeny path
    page.click_on("Show progeny")
    # Then that horse's progeny are displayed
    page.text.must_include horses(:joriah).name
  end

end
