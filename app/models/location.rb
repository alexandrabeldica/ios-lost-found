class Location < ActiveRecord::Base

	attr_accessible :latitude, :longitude, :country, :city, :address, :lfitem_id
	validates :latitude, :longitude, :presence => true
	belongs_to :item

end