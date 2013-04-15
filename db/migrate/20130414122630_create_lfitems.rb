class CreateLfitems < ActiveRecord::Migration
  def change
    create_table :lfitems do |t|
      t.string :type
      t.string :title
      t.string :description
      t.string :reward
      t.string :photo_path
      t.integer :category_id
      t.integer :location_id

      t.timestamps
    end
  end
end
