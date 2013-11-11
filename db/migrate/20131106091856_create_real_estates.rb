class CreateRealEstates < ActiveRecord::Migration
  def change
    create_table :real_estates do |t|
      # group 1 for real_estate, 2 for pre_sale, 3 for rent
      t.integer :estate_group 
      t.string :estate_town
      t.string :estate_type
      t.string :address
      
      t.decimal :ground_exchange_area
      t.decimal :ground_rent_area
      t.string :ground_usage
      
      t.string :date_buy     
      t.string :content_buy
      
      t.string :date_rent
      t.string :content_rent

      t.string  :rent_layer
      t.string  :buy_layer
      t.integer :building_total_layer
      t.string  :building_type
      t.string  :main_purpose
      t.string  :main_material
      t.string  :date_built
      t.decimal :building_exchange_area
      t.integer :building_room
      t.integer :building_sitting_room
      t.integer :building_rest_room
      t.string  :is_guarding
      t.string  :is_having_furnitures

      t.integer :buy_total_price
      t.decimal :buy_per_square_feet

      t.integer :rent_total_price
      t.decimal :rent_per_square_feet

      t.string  :parking_type
      t.decimal :parking_exchage_area
      t.integer :parking_total_price
      
      t.decimal :x_lat,  :precision => 15, :scale => 10
      t.decimal :y_long, :precision => 15, :scale => 10

      t.string  :search_address

      t.timestamps
    end
  end
end
