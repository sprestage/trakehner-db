class Horse < ActiveRecord::Base
  default_scope order('name DESC')

  has_many :offspring, class_name: "Horse", foreign_key: :sire_id,
                                            foreign_key: :dam_id

  belongs_to :sire, class_name: "Horse", foreign_key: :sire_id
  belongs_to :dam, class_name: "Horse", foreign_key: :dam_id

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

end
