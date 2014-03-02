class HomeController < ApplicationController

  def index
    horses_with_image = Horse.where(['image != ?', "%""%"])
    @horse = horses_with_image.sample
  end

end
