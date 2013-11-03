class Horse < ActiveRecord::Base

  attr_accessible :name, :image

  has_many :offspring, class_name: "Horse", foreign_key: :sire_id,
                                            foreign_key: :dam_id

  belongs_to :sire, class_name: "Horse", foreign_key: :sire_id
  belongs_to :dam, class_name: "Horse", foreign_key: :dam_id

  validates :name, presence: true
  validates :name, uniqueness: true

  acts_as_nested_set

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

end