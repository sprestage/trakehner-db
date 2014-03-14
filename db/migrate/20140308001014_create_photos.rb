class CreatePhotos < ActiveRecord::Migration

  def change

    create_table :photos do |t|
      t.string :name
      t.string :image
      t.string :attribution
      t.integer :horse_id
      t.timestamps
    end

  end

end
