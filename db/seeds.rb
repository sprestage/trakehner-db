# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# ('a'..'z').each do |initial|
#   puts "Importing horses with initial #{ initial }"
#   filename = "app/assets/data/json/horses_from_ATA_site/horses_initial_#{ initial }.json"
#   records = JSON.parse(File.read(filename))
#   records.each do |record|
#     Horse.create_from_json(record)
#   end
# end

puts "Importing stallion images"
filename = "app/assets/data/json/ata_2013_approved_stallions.json"
records = JSON.parse(File.read(filename))
records.each do |r|
  Horse.import_image_from_remote(r)
end