# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131110021836) do

  create_table "pre_sales", :force => true do |t|
    t.string   "estate_town"
    t.string   "estate_type"
    t.string   "address"
    t.decimal  "ground_exchange_area",   :precision => 10, :scale => 0
    t.string   "ground_usage"
    t.string   "date_buy"
    t.string   "content_buy"
    t.string   "buy_layer"
    t.integer  "building_total_layer"
    t.string   "building_type"
    t.string   "main_purpose"
    t.string   "main_material"
    t.string   "date_built"
    t.decimal  "building_exchange_area", :precision => 10, :scale => 0
    t.integer  "building_room"
    t.integer  "building_sitting_room"
    t.integer  "building_rest_room"
    t.string   "is_guarding"
    t.integer  "buy_total_price"
    t.decimal  "buy_per_square_feet",    :precision => 10, :scale => 0
    t.string   "parking_type"
    t.decimal  "parking_exchage_area",   :precision => 10, :scale => 0
    t.integer  "parking_total_price"
    t.decimal  "x_lat",                  :precision => 15, :scale => 10
    t.decimal  "y_long",                 :precision => 15, :scale => 10
    t.datetime "created_at",                                             :null => false
    t.datetime "updated_at",                                             :null => false
    t.string   "search_address"
  end

  create_table "real_estates", :force => true do |t|
    t.string   "estate_town"
    t.string   "estate_type"
    t.string   "address"
    t.decimal  "ground_exchange_area",   :precision => 10, :scale => 0
    t.string   "ground_usage"
    t.string   "date_buy"
    t.string   "content_buy"
    t.string   "buy_layer"
    t.integer  "building_total_layer"
    t.string   "building_type"
    t.string   "main_purpose"
    t.string   "main_material"
    t.string   "date_built"
    t.decimal  "building_exchange_area", :precision => 10, :scale => 0
    t.integer  "building_room"
    t.integer  "building_sitting_room"
    t.integer  "building_rest_room"
    t.string   "is_guarding"
    t.integer  "buy_total_price"
    t.decimal  "buy_per_square_feet",    :precision => 10, :scale => 0
    t.string   "parking_type"
    t.decimal  "parking_exchage_area",   :precision => 10, :scale => 0
    t.integer  "parking_total_price"
    t.decimal  "x_lat",                  :precision => 15, :scale => 10
    t.decimal  "y_long",                 :precision => 15, :scale => 10
    t.datetime "created_at",                                             :null => false
    t.datetime "updated_at",                                             :null => false
    t.string   "search_address"
  end

  create_table "rents", :force => true do |t|
    t.string   "estate_town"
    t.string   "rent_type"
    t.string   "address"
    t.decimal  "ground_rent_area",       :precision => 10, :scale => 0
    t.string   "ground_usage"
    t.string   "date_rent"
    t.string   "content_rent"
    t.string   "rent_layer"
    t.integer  "building_total_layer"
    t.string   "building_type"
    t.string   "main_purpose"
    t.string   "main_material"
    t.string   "date_built"
    t.decimal  "building_exchange_area", :precision => 10, :scale => 0
    t.integer  "building_room"
    t.integer  "building_sitting_room"
    t.integer  "building_rest_room"
    t.string   "is_guarding"
    t.string   "is_having_furnitures"
    t.integer  "rent_total_price"
    t.decimal  "rent_per_square_feet",   :precision => 10, :scale => 0
    t.string   "parking_type"
    t.decimal  "parking_exchage_area",   :precision => 10, :scale => 0
    t.integer  "parking_total_price"
    t.decimal  "x_lat",                  :precision => 15, :scale => 10
    t.decimal  "y_long",                 :precision => 15, :scale => 10
    t.datetime "created_at",                                             :null => false
    t.datetime "updated_at",                                             :null => false
    t.string   "search_address"
  end

end
