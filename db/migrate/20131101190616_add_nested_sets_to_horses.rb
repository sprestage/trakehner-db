class AddNestedSetsToHorses < ActiveRecord::Migration

  def change
    add_column :horses, :lft, :integer
    add_column :horses, :rgt, :integer
    add_column :horses, :parent_id, :integer
  end

end