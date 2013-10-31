class AddParentsToHorses < ActiveRecord::Migration
  def change
    add_column :horses, :dam_id, :integer
    add_column :horses, :sire_id, :integer
  end
end
