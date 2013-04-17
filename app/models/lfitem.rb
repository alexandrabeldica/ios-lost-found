class Lfitem < ActiveRecord::Base

	attr_accessible :lftype, :title, :description, :reward, :photo_path, :category_id
	validates :lftype, :title, :description, :presence => true
	belongs_to :category
	has_one :location, :foreign_key => :lfitem_id, :dependent => :destroy

end