class AddSearchAddressToRealEstate < ActiveRecord::Migration
  def change
    add_column :real_estates, :search_address, :string
  end
end
