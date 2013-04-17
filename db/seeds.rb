# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cat = Category.create(:name => "Pets", :description => "A pet that you lost or found")
item = Lfitem.new(:lftype => "lost", :title => "Golden retreiver", :description => "I lost my golden", :reward => "20$", :photo_path => "C:/Users/Alexandra/Desktop/univbuc.jpg", :category_id => cat.id)
loc = Location.create(:longitude => 45.66, :latitude => 23.66, :city => "City", :country => "Country", :address => "Street Number 1")
item.location = loc
item.save