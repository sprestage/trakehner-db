# ruby -Itest test/features/import/import_horse_from_json_test.rb

require "test_helper"

feature "Import horse" do
  scenario "Import a horse from a JSON file" do

    records = JSON.parse(File.read('test/features/import/import_test_data/import_test_data.json'))
    records.each do |record|

      horse = Horse.new
      ### TODO: We should check DB for horse already existing instead
      ###        of just adding the horse like we are doing now.
      # @horses = Horse.search(params[:search])
      # @horses.each do |h|
      #   if h.name == name
      #     puts "#{h.name} already exists in the DB.  Should skip adding to DB again."
      #   else
      #     # Nothing to do here, except jump out of horses.each, if I can
      #     #  figure out how to do that.
      #   end
      # end
      horse.name = record["name"]
      horse.registration_number = record["registration_number"]
      horse.sex = record["sex"]
      horse.color = record["color"]
      horse.birth_year = record["birth_year"]
      ### TODO: Here is another place where I should search the DB for names
      ###         and create and new horse object if the name isn't already
      ###         in the DB got both sire and dam.
      # horse.sire = record["sire"]
      # horse.dam = record["dam"]
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
