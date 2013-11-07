class CreatePreSales < ActiveRecord::Migration
  def change
    create_table :pre_sales do |t|
      t.string :estate_town
      t.string :estate_type
      t.string :address

      t.decimal :ground_exchange_area
      t.string :ground_usage

      t.string :date_buy
      t.string :content_buy

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

      t.integer :buy_total_price
      t.decimal :buy_per_square_feet

      t.string  :parking_type
      t.decimal :parking_exchage_area
      t.integer :parking_total_price

      t.decimal :x_lat,  :precision => 15, :scale => 10
      t.decimal :y_long, :precision => 15, :scale => 10

      t.timestamps
    end
  end
end
