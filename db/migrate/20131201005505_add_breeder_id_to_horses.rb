class AddBreederIdToHorses < ActiveRecord::Migration
  def change
    add_column :horses, :breeder_id, :integer
  end
end
