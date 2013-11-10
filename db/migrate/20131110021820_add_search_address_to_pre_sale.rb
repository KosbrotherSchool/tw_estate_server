class AddSearchAddressToPreSale < ActiveRecord::Migration
  def change
    add_column :pre_sales, :search_address, :string
  end
end
