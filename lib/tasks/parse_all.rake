namespace :parse do
  task :all => ["parse_xml_data:parse_estate","parse_xml_data:parse_presale","parse_xml_data:parse_rents"]
end