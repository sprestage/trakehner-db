# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
records = JSON.parse(File.read('test/features/import/import_test_data/import_test_data.json'))
records.each do |record|
  Horse.create_from_json(record)
end