class Horse < ActiveRecord::Base
  default_scope { order('name ASC') }

  has_many :offspring, class_name: "Horse", foreign_key: :sire_id,
                                            foreign_key: :dam_id

  belongs_to :sire, class_name: "Horse", foreign_key: :sire_id
  belongs_to :dam, class_name: "Horse", foreign_key: :dam_id
  belongs_to :breeder

  validates :name, presence: true
  validates :name, uniqueness: true

  mount_uploader :image, ImageUploader

  def self.search(search)
    if search
      # ILIKE == case-insensitive LIKE for PostgreSQL
      Horse.all.where(['name ILIKE ?', "%#{search}%"])
    else
      Horse.all
    end
  end

  alias_method :default_sire, :sire
  def sire
    return self.default_sire || Horse.new(name: 'Unknown')
  end

  alias_method :default_dam, :dam
  def dam
    return self.default_dam || Horse.new(name: 'Unknown')
  end

  def self.create_from_json(record)

    if record["name"].empty? || record["name"] == nil
      puts "Empty name in horse record, dumping data"
      puts record
      return
    end

    horse = Horse.find_by name: record["name"]
    unless horse
      horse = Horse.new
    end

    horse.name = record["name"]
    horse.registration_number = record["registration_number"]
    horse.sex = record["sex"]
    horse.color = record["color"]
    horse.birth_year = record["birth_year"]

    sire_name = record["sire"]
    unless sire_name.empty? || sire_name == nil || sire_name == "---"
      sire = Horse.find_by name: record["sire"]
      if sire
        horse.sire = sire
      else
        sire = Horse.new(name: record["sire"])
        sire.save!
        horse.sire = sire
      end
    end

    dam_name = record["dam"]
    unless dam_name.empty? || dam_name == nil || dam_name == "---"
      dam = Horse.find_by name: record["dam"]
      if dam
        horse.dam = dam
      else
        dam = Horse.new(name: record["dam"])
        dam.save!
        horse.dam = dam
      end
    end

    unless record["breeder"].empty? || record["breeder"] == nil || record["breeder"] == "---"
      horse.breeder = Breeder.fetch(record["breeder"])
    end

    horse.performance_records_available = record["performance_records_available"]

    if horse.save
      # Do nothing if the save is successful.
    else
      puts "Horse name #{ horse.name } save-to-database failed"
    end

  end

  def self.import_image_from_remote(record)
    horse = Horse.find_by name: record["name"]
    unless horse
      horse = Horse.new
      horse.name = record["name"]
    end
    horse.remote_image_url = record["image"]

    if horse.save
      # Do nothing if the save is successful.
    else
      puts "Horse name #{ horse.name } save-to-database failed"
    end
  end

end
