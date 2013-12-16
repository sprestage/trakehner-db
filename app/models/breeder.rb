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

  def self.fetch(name)
    unless name.empty? || name == nil || name == "---"
      breeder = Breeder.find_by name: name
      unless breeder
        breeder = Breeder.new name: name
        breeder.save!
      end
    end
    return breeder
  end

end
