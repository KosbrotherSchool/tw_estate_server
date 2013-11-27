# encoding: utf-8
namespace :parse_xml_data do

	# sale_estate => estate_group = 1, pre_sale_estate => estate_group = 2, rent_estate => estate_group = 3

	task :parse_estate => :environment do
		
		root = Rails.root.to_s #make sure string
		files =  Dir.glob(root+"/lib/datas/estates/*")
		files.each do |the_file_path|

			file = Nokogiri::XML(File.open(the_file_path))
			Nodes = file.children.children	

	        Nodes.each do |estate|
	            if(estate.children.size() != 0)
	            	newEstate = RealEstate.new
	            	newEstate.estate_group = 1
	            	newEstate.estate_town = estate.children[1].children.to_s
	            	newEstate.estate_type = estate.children[3].children.to_s

	            	address = estate.children[5].children.to_s
	            	num_repeate = address.scan(newEstate.estate_town).size()
	            	while num_repeate > 1
	            		address = address.sub(newEstate.estate_town,"")
	            		num_repeate = num_repeate - 1
	            	end
	            	newEstate.address = address
	            	
	            	newEstate.ground_exchange_area = estate.children[7].children.to_s.to_f
	            	newEstate.ground_usage = estate.children[9].children.to_s

	            	newEstate.date_buy = estate.children[15].children.to_s

	            	newEstate.content_buy = estate.children[17].children.to_s

	            	newEstate.buy_layer = estate.children[19].children.to_s
	            	newEstate.building_total_layer = estate.children[21].children.to_s
	            	newEstate.building_type = estate.children[23].children.to_s
	            	newEstate.main_purpose = estate.children[25].children.to_s
	            	newEstate.main_material = estate.children[27].children.to_s
	            	newEstate.date_built = estate.children[29].children.to_s
	            	newEstate.building_exchange_area = estate.children[31].children.to_s.to_f
	            	newEstate.building_room = estate.children[33].children.to_s.to_i
	            	newEstate.building_sitting_room = estate.children[35].children.to_s.to_i
	            	newEstate.building_rest_room = estate.children[37].children.to_s.to_i
	            	newEstate.is_guarding = estate.children[41].children.to_s

	            	newEstate.buy_total_price = estate.children[43].children.to_s.to_f
	            	newEstate.buy_per_square_feet = estate.children[45].children.to_s.to_f

	            	newEstate.parking_type = estate.children[47].children.to_s
	            	newEstate.parking_exchage_area = estate.children[49].children.to_s.to_f
	            	newEstate.parking_total_price = estate.children[51].children.to_s.to_f
	            	newEstate.search_address = set_search_address(newEstate.address, newEstate.estate_town)
	            	newEstate.save
	            	# puts "Estate Address" + " "+newEstate.search_address
	            end
	        end
	    end
    end

    task :parse_presale => :environment do
		
		root = Rails.root.to_s #make sure string
		files =  Dir.glob(root+"/lib/datas/pre_sale/*")

		files.each do |the_file_path|

			file = Nokogiri::XML(File.open(the_file_path))
			Nodes = file.children.children	

	        Nodes.each do |estate|
	        	if(estate.children.size() != 0)
	            	newEstate = RealEstate.new
	            	newEstate.estate_group = 2
	            	newEstate.estate_town = estate.children[1].children.to_s
	            	newEstate.estate_type = estate.children[3].children.to_s
	            	# newEstate.address = estate.children[5].children.to_s
	            	
	            	address = estate.children[5].children.to_s
	            	num_repeate = address.scan(newEstate.estate_town).size()
	            	while num_repeate > 1
	            		address = address.sub(newEstate.estate_town,"")
	            		num_repeate = num_repeate - 1
	            	end
	            	newEstate.address = address

	            	newEstate.ground_exchange_area = estate.children[7].children.to_s.to_f
	            	newEstate.ground_usage = estate.children[9].children.to_s

	            	newEstate.date_buy = estate.children[15].children.to_s

	            	newEstate.content_buy = estate.children[17].children.to_s

	            	newEstate.buy_layer = estate.children[19].children.to_s
	            	newEstate.building_total_layer = estate.children[21].children.to_s
	            	newEstate.building_type = estate.children[23].children.to_s
	            	newEstate.main_purpose = estate.children[25].children.to_s
	            	newEstate.main_material = estate.children[27].children.to_s
	            	newEstate.date_built = estate.children[29].children.to_s
	            	newEstate.building_exchange_area = estate.children[31].children.to_s.to_f
	            	newEstate.building_room = estate.children[33].children.to_s.to_i
	            	newEstate.building_sitting_room = estate.children[35].children.to_s.to_i
	            	newEstate.building_rest_room = estate.children[37].children.to_s.to_i
	            	newEstate.is_guarding = estate.children[41].children.to_s

	            	newEstate.buy_total_price = estate.children[43].children.to_s.to_f
	            	newEstate.buy_per_square_feet = estate.children[45].children.to_s.to_f

	            	newEstate.parking_type = estate.children[47].children.to_s
	            	newEstate.parking_exchage_area = estate.children[49].children.to_s.to_f
	            	newEstate.parking_total_price = estate.children[51].children.to_s.to_f
	            	newEstate.search_address = set_search_address(newEstate.address, newEstate.estate_town)
	            	newEstate.save
	            	# puts "Estate Address" + " "+newEstate.search_address
	            end
	        end
	    end
	end


	task :parse_rents => :environment do
		
		root = Rails.root.to_s #make sure string
		files =  Dir.glob(root+"/lib/datas/rents/*")

		files.each do |the_file_path|

			file = Nokogiri::XML(File.open(the_file_path))
			Nodes = file.children.children	

	        Nodes.each do |rent|
	        	if(rent.children.size() != 0)
	        		newRent = RealEstate.new
	        		newRent.estate_group = 3
	        		newRent.estate_town 		 	= rent.children[1].children.to_s
	            	newRent.estate_type			 	= rent.children[3].children.to_s
	            	# newRent.address 			 	= rent.children[5].children.to_s

	            	address = rent.children[5].children.to_s
	            	num_repeate = address.scan(newRent.estate_town).size()
	            	while num_repeate > 1
	            		address = address.sub(newRent.estate_town,"")
	            		num_repeate = num_repeate - 1
	            	end
	            	newRent.address = address
	            	
	            	newRent.ground_rent_area 	 	= rent.children[7].children.to_s.to_f
	            	newRent.ground_usage 		 	= rent.children[9].children.to_s

	            	newRent.date_rent 			 	= rent.children[15].children.to_s

	            	newRent.content_rent 		 	= rent.children[17].children.to_s

	            	newRent.rent_layer 			 	= rent.children[19].children.to_s
	            	newRent.building_total_layer 	= rent.children[21].children.to_s
	            	newRent.building_type 		 	= rent.children[23].children.to_s
	            	newRent.main_purpose 		 	= rent.children[25].children.to_s
	            	newRent.main_material 		 	= rent.children[27].children.to_s
	            	newRent.date_built 			 	= rent.children[29].children.to_s
	            	newRent.building_exchange_area  = rent.children[31].children.to_s.to_f
	            	newRent.building_room 			= rent.children[33].children.to_s.to_i
	            	newRent.building_sitting_room 	= rent.children[35].children.to_s.to_i
	            	newRent.building_rest_room 		= rent.children[37].children.to_s.to_i
	            	newRent.is_guarding 			= rent.children[41].children.to_s
	            	newRent.is_having_furnitures 	= rent.children[43].children.to_s

	            	newRent.rent_total_price 		= rent.children[45].children.to_s.to_f
	            	newRent.rent_per_square_feet 	= rent.children[47].children.to_s.to_f

	            	newRent.parking_type 			= rent.children[49].children.to_s
	            	newRent.parking_exchage_area 	= rent.children[51].children.to_s.to_f
	            	newRent.parking_total_price 	= rent.children[53].children.to_s.to_f
	            	newRent.search_address = set_search_address(newRent.address, newRent.estate_town)
	            	newRent.save
	            	# puts "Rent Address" + " "+newRent.search_address
	        	end
	        end
	    end
	end

	task :crawl_estate_coordiate => :environment do
        RealEstate.all.each do |estate|
            CrawlCoordinateWorker.perform_async(estate.id)
        end
    end

    # task :crawl_presale_coordiate => :environment do
    #     PreSale.all.each do |estate|
    #         CrawlPresaleCoordinateWorker.perform_async(estate.id)
    #     end
    # end

    # task :crawl_rent_coordiate => :environment do
    #     Rent.all.each do |estate|
    #         CrawlRentCoordinateWorker.perform_async(estate.id)
    #     end
    # end

    #  puts estate repeate address
    task :reset_repeat_address => :environment do
	    RealEstate.select('id,search_address').all.each do |estate|
	    	search_address = estate.search_address
	    	repeat_estates = RealEstate.where("search_address Like?", "#{search_address}")
			if ( repeat_estates.size() > 1) 
				puts "estate id = " + estate.id.to_s + ", search_address = " + estate.search_address
				snatch = search_address[/(\d*)號/]
				current_num = snatch[/(\d*)/].to_i
				repeat_estates.each do |item|
					item.search_address = item.search_address.gsub(/(\d*)號/, current_num.to_s + "號")
					current_num = current_num + 1
					item.save
				end
			end
		end

		# PreSale.select('id,search_address').all.each do |estate|
	 #    	search_address = estate.search_address
	 #    	repeat_estates = PreSale.where("search_address Like?", "#{search_address}")
		# 	if ( repeat_estates.size() > 1) 
		# 		puts "pre_sale id = " + estate.id.to_s + ", search_address = " + estate.search_address
		# 		snatch = search_address[/(\d*)號/]
		# 		current_num = snatch[/(\d*)/].to_i
		# 		repeat_estates.each do |item|
		# 			item.search_address = item.search_address.gsub(/(\d*)號/, current_num.to_s + "號")
		# 			current_num = current_num + 1
		# 			item.save
		# 		end
		# 	end
		# end

		# Rent.select('id,search_address').all.each do |estate|
	 #    	search_address = estate.search_address
	 #    	repeat_estates = Rent.where("search_address Like?", "#{search_address}")
		# 	if ( repeat_estates.size() > 1) 
		# 		puts "rent id = " + estate.id.to_s + ", search_address = " + estate.search_address
		# 		snatch = search_address[/(\d*)號/]
		# 		current_num = snatch[/(\d*)/].to_i
		# 		repeat_estates.each do |item|
		# 			item.search_address = item.search_address.gsub(/(\d*)號/, current_num.to_s + "號")
		# 			current_num = current_num + 1
		# 			item.save
		# 		end
		# 	end
		# end

	end

	def set_search_address(address, home_town)
		search_address = address
		begin
			# set number from first num
			nums = address[/(\d*)~(\d*)/]
	    	first_num = nums[0..nums.index("~")-1].to_i
	    	# second_num = nums[nums.index("~")+1..nums.length].to_i
	    	# even_num = (first_num + second_num)/2
	    	# search_address = search_address.gsub(/(\d*)~(\d*)/,even_num.to_s)
	    	search_address = search_address.gsub(/(\d*)~(\d*)/,first_num.to_s)
		rescue Exception => e
			puts "problem: " + address
		end
		    	
    	# set home town
    	if (!search_address.index(home_town))
      		search_address = home_town + search_address
    	end

    	# for some ground estate
    	search_address = search_address.gsub(/段.*小段/, '路')
    	search_address = search_address.gsub(/地號/, '號')

    	return search_address
  	end

end