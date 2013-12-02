class Breeder < ActiveRecord::Base
  default_scope { order('name ASC') }

  has_many :horses, foreign_key: :breeder_id

  validates :name, presence: true
  validates :name, uniqueness: true

  def self.search_name(search_name)
    if search_name
      # ILIKE == case-insensitive LIKE for PostgreSQL
      Breeder.all.where(['name ILIKE ?', "%#{ search_name }%"])
    else
      Breeder.all
    end
  end

  def self.search_address(search_address)
    if search_address
      Breeder.all.where(['address ILIKE ?', "%#{ search_address }%"])
    else
      Breeder.all
    end
  end

  def self.fetch(name)
    breeder = Breeder.find_by name: name
    unless breeder
      breeder = Breeder.new name: name
      breeder.save!
    end
    return breeder
  end

end
