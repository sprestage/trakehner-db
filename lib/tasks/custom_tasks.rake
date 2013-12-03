
require "#{Rails.root}/app/models/horse"
require "#{Rails.root}/app/uploaders/image_uploader"

task :load_scraped_json do
  records = JSON.parse(File.read('app/assets/data/json/horses_initial_a.json'))
  records.each do |record|
    Horse.create!(record)
  end
end

task :import_stallion_images do
  filename = "app/assets/data/json/ata_2013_approved_stallions.json"
  records = JSON.parse(File.read(filename))
  records.each do |r|
    Horse.import_image_from_remote(r)
  end
end

task :update_stallion_thumbnails do
  horses = Horse.all()
  horses.each do |horse|
    if image
      horse.image.recreate_versions!
    end
  end
end