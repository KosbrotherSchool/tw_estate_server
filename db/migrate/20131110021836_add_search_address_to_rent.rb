class AddSearchAddressToRent < ActiveRecord::Migration
  def change
    add_column :rents, :search_address, :string
  end
end
