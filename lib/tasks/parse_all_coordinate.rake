namespace :parse_cordinate do
  task :all => ["parse_xml_data:crawl_estate_coordiate","parse_xml_data:crawl_presale_coordiate","parse_xml_data:crawl_rent_coordiate"]
end