# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Location.create(:longitude => 45.66, :latitude => 23.66, :city => "City", :country => "Country", :address => "Street Number 1")
Category.create(:name => "Pets", :description => "A pet that you lost or found")
Lfitem.create(:lftype => "lost", :title => "Golden retreiver", :description => "I lost my golden", :reward => "20$", :photo_path => "C:/Users/Alexandra/Desktop/univbuc.jpg", :category_id => 1, :location_id => 1)