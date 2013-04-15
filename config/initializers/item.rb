# items = Lfitem.where("created_at <= '" + (DateTime.now - 10).to_s + "'")

# items.each do |item|
# 	Location.find(item.location_id).destroy
# 	Lfitem.find(item.id).destroy
# end