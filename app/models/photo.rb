class Photo < ActiveRecord::Base

  belongs_to :horse
  validates_presence_of :horse_id

  mount_uploader :image, ImageUploader

end
