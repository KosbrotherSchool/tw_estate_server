#  rake procedure
#  1. rake parse:all 
#  2. rake parse_xml_data:reset_repeat_address
#  3. rake parse_xml_data:crawl_estate_coordiate 

namespace :parse do
  task :all => ["parse_xml_data:parse_estate","parse_xml_data:parse_presale","parse_xml_data:parse_rents"]
end