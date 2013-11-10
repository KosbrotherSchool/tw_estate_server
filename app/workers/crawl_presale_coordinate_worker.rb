# encoding: utf-8
class CrawlPresaleCoordinateWorker
  include Sidekiq::Worker
  sidekiq_options queue: "estate"
  
  def perform(estate_id)
    estate = PreSale.select("id, search_address").find(estate_id)
    search_address = estate.search_address

    search_address = URI::encode(search_address)
    json_object = JSON.parse(open("http://maps.googleapis.com/maps/api/geocode/json?address=#{search_address}&sensor=false&region=tw").read)
    estate.x_lat = json_object["results"][0]["geometry"]["location"]["lat"]
    estate.y_long =  json_object["results"][0]["geometry"]["location"]["lng"]
    estate.save
    sleep 1
 
  end

end