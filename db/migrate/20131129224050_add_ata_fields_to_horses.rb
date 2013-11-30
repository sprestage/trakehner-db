class AddAtaFieldsToHorses < ActiveRecord::Migration
  def change
    add_column :horses, :registration_number, :string
    add_column :horses, :sex, :string
    add_column :horses, :color, :string
    add_column :horses, :birth_year, :integer
    add_column :horses, :breeder, :string
    add_column :horses, :performance_records_available, :boolean
  end
end
