class LfitemController < ApplicationController

	require 'json'

	def save_photo(photo, item_id)

		s3 = AWS::S3.new
		bucket = s3.buckets['ios-lost-found']
		photo_name = ""

		if bucket.exists?
			photo_name = item_id.to_s + ".jpg"

			obj = bucket.objects[photo_name]
			obj.write(photo)
		end

		return photo_name

	end

	def new

		item = Lfitem.new(params[:item])
		location = Location.new(params[:location])

		item.location = location

		respond_to do |format|

			if item.save

				#save photo on amazon S3 and save photo name
				item.photo_path = save_photo(params[:photo], item.id)

				if item.save
					format.json {
						render json: {:message => "Item created"}, status: :created
					}
				else
					format.json {
						render json: {:error => item.errors}, status: :unprocessable_entity
					}
				end
			else
				format.json {
					render json: {:error => location.errors}, status: :unprocessable_entity
				}
			end

		end

	end

	def get_categories

		categories = Category.all

		respond_to do |format|

			format.json {
				render json: categories, status: :ok
			}

		end

	end

	def get_items

		ok_type = true
		category_id = params[:id_category]
		total_items = Array.new

		if params[:lftype] == "lost"
			items = Lfitem.where(:lftype => "lost", :category_id => category_id)
		else
			if params[:lftype] == "found"
				items = Lfitem.where(:lftype => "found", :category_id => category_id)
			else
				ok_type = false
			end
		end

		items.each do |item|

			total_item = Hash.new

			total_item["id"] = item.id
			total_item["lftype"] = item.lftype
			total_item["title"] = item.title
			total_item["description"] = item.description
			total_item["reward"] = item.reward
			total_item["photo_path"] = item.photo_path
			total_item["category_id"] = item.category_id
			total_item["latitude"] = item.location.latitude
			total_item["longitude"] = item.location.longitude
			total_item["country"] = item.location.country
			total_item["city"] = item.location.city
			total_item["address"] = item.location.address

			total_items.push(total_item)

		end

		respond_to do |format|
			if ok_type
				if items.count > 0
				format.json {
					render json: total_items, status: :ok
				}
				else
					format.json {
						render json: {:message => "No " + params[:lftype] + " items"}, status: :ok
					}
				end
			else
				format.json {
					render json: {:error => "No " + params[:lftype] + " type in Lfitem table"}, status: :unprocessable_entity
				}
			end 

		end

	end

	def get_item

		respond_to do |format|

			begin

				item = Lfitem.find(params[:id])
				total_item = Hash.new

				total_item["id"] = item.id
				total_item["lftype"] = item.lftype
				total_item["title"] = item.title
				total_item["description"] = item.description
				total_item["reward"] = item.reward
				total_item["photo_path"] = item.photo_path
				total_item["category_id"] = item.category_id
				total_item["latitude"] = item.location.latitude
				total_item["longitude"] = item.location.longitude
				total_item["country"] = item.location.country
				total_item["city"] = item.location.city
				total_item["address"] = item.location.address

				format.json {
					render json: total_item, status: :ok
				}

			rescue Exception

				format.json {
					render json: {:message => "No item with such id"}, status: :ok
				}

			end

		end
	end

end
