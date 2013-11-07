# encoding: utf-8
namespace :parse_xml_data do

	task :parse_estate => :environment do
		
		root = Rails.root.to_s #make sure string
		files =  Dir.glob(root+"/lib/datas/estates/*")
		files.each do |the_file_path|

			file = Nokogiri::XML(File.open(the_file_path))
			Nodes = file.children.children	

	        Nodes.each do |estate|
	            if(estate.children.size() != 0)
	            	newEstate = RealEstate.new
	            	newEstate.estate_town = estate.children[1].children.to_s
	            	newEstate.estate_type = estate.children[3].children.to_s
	            	newEstate.address = estate.children[5].children.to_s
	            	
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
	            	newEstate.save
	            	puts "Estate Address" + " "+newEstate.address
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
	            	newEstate = PreSale.new
	            	newEstate.estate_town = estate.children[1].children.to_s
	            	newEstate.estate_type = estate.children[3].children.to_s
	            	newEstate.address = estate.children[5].children.to_s
	            	
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
	            	newEstate.save
	            	puts "Estate Address" + " "+newEstate.address
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
	        		newRent = Rent.new
	        		newRent.estate_town 		 	= rent.children[1].children.to_s
	            	newRent.rent_type			 	= rent.children[3].children.to_s
	            	newRent.address 			 	= rent.children[5].children.to_s
	            	
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
	            	newRent.save
	            	puts "Rent Address" + " "+newRent.address
	        	end
	        end
	    end
	end

	task :crawl_estate_coordiate => :environment do
        RealEstate.all.each do |estate|
            CrawlCoordinateWorker.perform_async(estate.id)
        end
    end

    task :crawl_presale_coordiate => :environment do
        PreSale.all.each do |estate|
            CrawlPresaleCoordinateWorker.perform_async(estate.id)
        end
    end

    task :crawl_rent_coordiate => :environment do
        Rent.all.each do |estate|
            CrawlRentCoordinateWorker.perform_async(estate.id)
        end
    end

    #  puts estate repeate address
    task :puts_repeat_address => :environment do
	    RealEstate.select('id,address').all.each do |estate|
	    	address = estate.address
			if (address.scan("區").size > 1) 
				puts "id = " + estate.id.to_s
			end
		end
	end

end