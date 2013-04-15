class Lfitem < ActiveRecord::Base

	attr_accessible :lftype, :title, :description, :reward, :photo_path, :category_id, :location_id
	validates :lftype, :title, :description, :presence => true
	belongs_to :category
	belongs_to :location

end