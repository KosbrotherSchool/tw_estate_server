# encoding: utf-8
class CrawlRentCoordinateWorker
  include Sidekiq::Worker
  sidekiq_options queue: "estate"
  
  def perform(estate_id)
    estate = Rent.select("id, search_address").find(estate_id)
    search_address = estate.search_address

    search_address = URI::encode(search_address)
    json_object = JSON.parse(open("http://maps.googleapis.com/maps/api/geocode/json?address=#{search_address}&sensor=false&region=tw").read)
    estate.x_lat = json_object["results"][0]["geometry"]["location"]["lat"]
    estate.y_long =  json_object["results"][0]["geometry"]["location"]["lng"]
    estate.save
    sleep 1
    # crawler = EstateCrawler.new
    # crawler.fetch_address_site estate.address
    # crawler.crawl_lat_long estate_id
    # puts novel.id
  end

end