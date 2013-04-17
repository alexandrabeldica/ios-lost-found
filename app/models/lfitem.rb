class Lfitem < ActiveRecord::Base

	attr_accessible :lftype, :title, :description, :reward, :photo_path, :category_id, :contact
	validates :lftype, :title, :description, :contact, :presence => true
	belongs_to :category
	has_one :location, :foreign_key => :lfitem_id, :dependent => :destroy
	validates_format_of :phone, 
                    :with => /\A[0-9]{10}\Z/, 
                    :allow_blank => true, 
                    :allow_nil => true

end