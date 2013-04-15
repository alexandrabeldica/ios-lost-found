class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.float :latitude
      t.float :longitude
      t.string :country
      t.string :city
      t.text :address

      t.timestamps
    end
  end
end
