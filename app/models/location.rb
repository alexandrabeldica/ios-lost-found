class Location < ActiveRecord::Base

	attr_accessible :latitude, :longitude, :country, :city, :address
	validates :latitude, :longitude, :presence => true
	has_one :item, :foreign_key => :location_id

end