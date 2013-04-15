class Category < ActiveRecord::Base

	attr_accessible :name, :description
	validates :name, :description, :presence => true 
	has_many :items, :foreign_key => :category_id

end