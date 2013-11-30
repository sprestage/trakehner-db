# ruby -Itest test/features/import/import_horse_from_json_test.rb

require "test_helper"

feature "Import horse" do
  scenario "Import a horse from a JSON file" do

    records = JSON.parse(File.read('test/features/import/import_test_data/import_test_data.json'))
    records.each do |record|
      Horse.create_from_json(record)
    end
    # Then a new horse(s) should have been created and displayed
    visit horses_path
    page.text.must_include "A Bit Of Mozart"
    page.text.must_include "A Cappella"
    page.text.must_include "A Classic Tradition"
  end
end
