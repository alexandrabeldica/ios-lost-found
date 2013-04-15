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

		location = Location.new(params[:location])
		respond_to do |format|

			if location.save

				item = Lfitem.new(params[:item])

				#set location id
				item.location_id = location.id

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

		if params[:lftype] == "lost"
			items = Lfitem.where(:lftype => "lost")
		else
			if params[:lftype] == "found"
				items = Lfitem.where(:lftype => "found")
			else
				ok_type = false
			end
		end

		respond_to do |format|
			if ok_type
				if items.count > 0
				format.json {
					render json: items, status: :ok
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

end
