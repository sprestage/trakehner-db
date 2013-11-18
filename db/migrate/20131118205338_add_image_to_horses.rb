class AddImageToHorses < ActiveRecord::Migration
  def change
    add_column :horses, :image, :string
  end
end
