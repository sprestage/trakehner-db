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
      Horse.all.where(['name LIKE ?', "%#{search}%"])
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

    ### TODO: Tell breeder model there is a new breeder name/address.  Then breeder
    ###       model will take the name/address, check to see if the name already
    ###       exists, or to add a new breeder if the the name doesn't exist.
    ### TODO: Once the above is done, change the below (horse.breeder) to be set
    ###       to the breeder instance, not just a string.
    ### Okay, I think the below does both of the above.  BUT, create doesn't seem
    ###  to be working.  *sigh*  Time for some pair programming.
    horse.breeder = Breeder.create_if_unique("A Name", "")
    # horse.breeder = Breeder.create_if_unique(record["breeder"], "")
    # horse.breeder = record["breeder"]

    horse.performance_records_available = record["performance_records_available"]

    if horse.save
      # Do nothing if the save is successful.
    else
      puts "Save horse to database failed!!!"
    end

  end

end
