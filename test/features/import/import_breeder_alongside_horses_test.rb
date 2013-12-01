# ruby -Itest test/features/import/import_breeder_alongside_horses_test.rb

require "test_helper"

feature "Import breeder" do
  scenario "Import breeders along with horses" do

    visit breeders_path
    page.text.wont_include "Dawn Metzger"
    page.text.wont_include "Sylvia Ross"

    records = JSON.parse(File.read('test/features/import/import_test_data/import_test_data.json'))
    records.each do |record|
      Horse.create_from_json(record)
    end

    # Then a new horse(s) should have been created and displayed
    visit breeders_path
    page.text.must_include "Dawn Metzger"
    page.text.must_include "Sylvia Ross"
  end
end
