
task :load_scraped_json  => :environment do
  records = JSON.parse(File.read('app/assets/data/json/horses_initial_a.json'))
  records.each do |record|
    Horse.create!(record)
  end
end

task :import_stallion_images  => :environment do
  filename = "app/assets/data/json/ata_2013_approved_stallions.json"
  records = JSON.parse(File.read(filename))
  records.each do |r|
    Horse.import_image_from_remote(r)
  end
end

task :update_stallion_thumbnails => :environment do
  horses = Horse.all()
  horses.each do |horse|
    if horse.image
      horse.image.recreate_versions!
    end
  end
end

task :create_admin => :environment do
  user = User.create! :email => 'admin@unofficialtrakehnerdatabase.com', :password => ENV['ADMIN_PASSWORD'], :password_confirmation => ENV['ADMIN_PASSWORD'], :role => 'admin'
end
