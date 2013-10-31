class AddPictureToHorses < ActiveRecord::Migration
  def change
    add_column :horses, :picture, :string
  end
end
