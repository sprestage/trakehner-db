class Breeder < ActiveRecord::Base
  default_scope { order('name ASC') }

  has_many :horses, foreign_key: :breeder_id

  validates :name, presence: true
  validates :name, uniqueness: true

  def self.search_name(search)
    if search
      Breeder.all.where(['name ILIKE ?', "%#{search}%"])
    else
      Breeder.all
    end
  end

  def self.search_address(search)
    if search
      Breeder.all.where(['address ILIKE ?', "%#{search}%"])
    else
      Breeder.all
    end
  end

  def self.create_if_unique(name, address)
    breeder = Breeder.find_by name
    unless breeder
      breeder = Breeder.new
    end

    breeder.name = name
    breeder.address = address

    if breeder.save
      # Do nothing if the save is successful.
    else
      puts "Save breeder to database failed!!!"
    end
  end
end
