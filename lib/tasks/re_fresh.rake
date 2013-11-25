namespace :re_fresh do

	task :loc_x_y => :environment do
		RealEstate.select('id, x_lat, y_long').all.each do |estate|
			puts estate.id
			x_lat = estate.x_lat
			y_long = estate.y_long
			if x_lat != nil
				repeat_estates = RealEstate.select("id, x_lat, y_long").where("x_lat = #{x_lat} and y_long= #{y_long}")
				if ( repeat_estates.size() > 1)
					i = 0 
					repeat_estates.each do |item|
						if (i > 0)
							item.x_lat = item.x_lat - i * 0.000025
							item.y_long = item.y_long - i * 0.00005
							item.save				
						end
						i = i + 1
					end
				end
			end
		end
	end

end