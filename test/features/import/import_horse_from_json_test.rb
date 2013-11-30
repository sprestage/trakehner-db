# ruby -Itest test/features/import/import_horse_from_json_test.rb

require "test_helper"

feature "Import horse" do
  scenario "Import a horse from a JSON file" do

    records = JSON.parse(File.read('test/features/import/import_test_data/import_test_data.json'))
    records.each do |record|

      horse = Horse.find_by name: record["name"]

      unless horse
        horse = Horse.new
      end

      horse.name = record["name"]
      horse.registration_number = record["registration_number"]
      horse.sex = record["sex"]
      horse.color = record["color"]
      horse.birth_year = record["birth_year"]

      sire = Horse.find_by name: record["sire"]
      if sire
        horse.sire = sire
      else
        sire = Horse.new(name: record["sire"])
        sire.save!
        horse.sire = sire
      end

      dam = Horse.find_by name: record["dam"]
      if dam
        horse.dam = dam
      else
        dam = Horse.new(name: record["dam"])
        dam.save!
        horse.dam = dam
      end

      horse.breeder = record["breeder"]
      horse.performance_records_available = record["performance_records_available"]

      if horse.save
        # Do nothing if the save is successful.
      else
        puts "Save to database failed!!!"
      end
    end
    # Then a new horse(s) should have been created and displayed
    visit horses_path
    page.text.must_include "A Bit Of Mozart"
    page.text.must_include "A Cappella"
    page.text.must_include "A Classic Tradition"
  end
end
