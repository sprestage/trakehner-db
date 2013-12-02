
task :load_scraped_json do
  records = JSON.parse(File.read('app/assets/data/json/horses_initial_a.json'))
  records.each do |record|
    Horse.create!(record)
  end
end

# http://seo-sem-tools.net/2012/07/30/rails-solr-sunspot-rake-tasks-list/
# List of rake tasks included in Sunspot
task :start_test_solr do
  `RAILS_ENV=test rake sunspot:solr:start`
  `RAILS_ENV=test rake sunspot:reindex`
  `rake test`
end

task :stop_test_solor do
  'RAILS_ENV=test rake sunspot:solr:stop'
end