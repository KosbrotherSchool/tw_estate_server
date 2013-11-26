class Api::V1::RealEstateController < ApplicationController
  
  # 25.053871,121.460052

  def around_all_by_areas
    center_x = params[:center_x].to_f
    cneter_y = params[:center_y].to_f
    spot1_x = params[:spot1_x].to_f
    spot1_y = params[:spot1_y].to_f
    spot2_x = params[:spot2_x].to_f
    spot2_y = params[:spot2_y].to_f
    spot3_x = params[:spot3_x].to_f
    spot3_y = params[:spot3_y].to_f
    items0 = RealEstate.where("x_lat IS NOT NULL and y_long IS NOT NULL" ).order("(ABS(#{center_x}-x_lat) + ABS(#{cneter_y}-y_long)) ASC").paginate(:page => 1, :per_page => 5)
    items1 = RealEstate.where("x_lat IS NOT NULL and y_long IS NOT NULL" ).order("(ABS(#{spot1_x}-x_lat) + ABS(#{spot1_y}-y_long)) ASC").paginate(:page => 1, :per_page => 5)
    items2 = RealEstate.where("x_lat IS NOT NULL and y_long IS NOT NULL" ).order("(ABS(#{spot2_x}-x_lat) + ABS(#{spot2_y}-y_long)) ASC").paginate(:page => 1, :per_page => 5)
    items3 = RealEstate.where("x_lat IS NOT NULL and y_long IS NOT NULL" ).order("(ABS(#{spot3_x}-x_lat) + ABS(#{spot3_y}-y_long)) ASC").paginate(:page => 1, :per_page => 5)
    items_all = items0 + items1 + items2 + items3
    render :json => items_all
  end

  def around_all
  	x = params[:x].to_f
    y = params[:y].to_f
    items = RealEstate.where("x_lat IS NOT NULL and y_long IS NOT NULL" ).order("(ABS(#{x}-x_lat) + ABS(#{y}-y_long)) ASC").paginate(:page => 1, :per_page => 5)
  	render :json => items
  end

  def estate_around
  	x = params[:x].to_f
    y = params[:y].to_f
    items = RealEstate.where("x_lat IS NOT NULL and y_long IS NOT NULL and  estate_group = 1 " ).order("(ABS(#{x}-x_lat) + ABS(#{y}-y_long)) ASC").paginate(:page => 1, :per_page => 75)
  	render :json => items
  end

  def presale_around
    x = params[:x].to_f
    y = params[:y].to_f
    items = RealEstate.where("x_lat IS NOT NULL and y_long IS NOT NULL and  estate_group = 2" ).order("(ABS(#{x}-x_lat) + ABS(#{y}-y_long)) ASC").paginate(:page => 1, :per_page => 75)
    render :json => items
  end

  def rent_around
    x = params[:x].to_f
    y = params[:y].to_f
    items = RealEstate.where("x_lat IS NOT NULL and y_long IS NOT NULL and  estate_group = 3" ).order("(ABS(#{x}-x_lat) + ABS(#{y}-y_long)) ASC").paginate(:page => 1, :per_page => 75)
    render :json => items
  end

  def estate_and_pre_sale_around
    x = params[:x].to_f
    y = params[:y].to_f
    items = RealEstate.where("x_lat IS NOT NULL and y_long IS NOT NULL and  estate_group !=  3" ).order("(ABS(#{x}-x_lat) + ABS(#{y}-y_long)) ASC").paginate(:page => 1, :per_page => 75)
    render :json => items
  end

  def estate_and_rent_around
    x = params[:x].to_f
    y = params[:y].to_f
    items = RealEstate.where("x_lat IS NOT NULL and y_long IS NOT NULL and  estate_group != 2" ).order("(ABS(#{x}-x_lat) + ABS(#{y}-y_long)) ASC").paginate(:page => 1, :per_page => 75)
    render :json => items
  end

  def pre_sale_and_rent_around
    x = params[:x].to_f
    y = params[:y].to_f
    items = RealEstate.where("x_lat IS NOT NULL and y_long IS NOT NULL and  estate_group != 1" ).order("(ABS(#{x}-x_lat) + ABS(#{y}-y_long)) ASC").paginate(:page => 1, :per_page => 75)
    render :json => items
  end

end
