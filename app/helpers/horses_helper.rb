module HorsesHelper

  def link_for_horse(horse)
    return "Unknown" if horse.name == "Unknown"
    link_to horse.name, horse
  end

end
