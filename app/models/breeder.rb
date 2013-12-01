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

  def self.fetch(name)
    breeder = Breeder.find_by name: name
    unless breeder
      breeder = Breeder.new name: name
      breeder.save!
    end
    return breeder
  end

end
