class Api::V1::RealEstateController < ApplicationController
  
  # 25.053871,121.460052

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
