# encoding: utf-8
class EstateCrawler
  include Crawler


  def change_node_br_to_newline node
    content = node.to_html
    content = content.gsub("<br>","\n")
    n = Nokogiri::HTML(content)
    n.text
  end


  def crawl_lat_long estate_id
  	estate = RealEstate.find(estate_id)
  	num = @page_html.css("script").text.index("GLatLng")
    text = @page_html.css("script").text[num..num+30]
  	x = text[text.index("(")+1..text.index(",")-1]
  	y = text[text.index(",")+1..text.index(")")-1]
  	estate.x_lat = x
  	estate.y_long = y
  	estate.save 
  end

  # def match_address(address)
  #   if (address.index"基隆")
  #     return 2
  #   elsif(address.index"台北市")
  #     return 3
  #   elsif(address.index"新北市")
  #     return 4
  #   elsif(address.index"桃園")
  #     return 5
  #   elsif(address.index"新竹市")
  #     return 6
  #   elsif(address.index"新竹縣")
  #     return 7
  #   elsif(address.index"苗栗")
  #     return 8
  #   elsif(address.index"台中")
  #     return 9
  #   elsif(address.index"南投")
  #     return 10
  #   elsif(address.index"彰化")
  #     return 11
  #   elsif(address.index"雲林")
  #     return 12
  #   elsif(address.index"嘉義市")
  #     return 13
  #   elsif(address.index"嘉義縣")
  #     return 14
  #   elsif(address.index"台南")
  #     return 15
  #   elsif(address.index"高雄")
  #     return 16
  #   elsif(address.index"屏東")
  #     return 17
  #   elsif(address.index"宜蘭")
  #     return 18
  #   elsif(address.index"花蓮")
  #     return 19
  #   elsif(address.index"台東")
  #     return 20
  #   elsif(address.index"澎湖")
  #     return 21
  #   elsif(address.index"連江")
  #     return 22
  #   elsif(address.index"金門")
  #     return 23
  #   end                                
  # end

end
