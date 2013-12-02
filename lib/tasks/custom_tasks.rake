
task :load_scraped_json do
  records = JSON.parse(File.read('app/assets/data/json/horses_initial_a.json'))
  records.each do |record|
    Horse.create!(record)
  end
end