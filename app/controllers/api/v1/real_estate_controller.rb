class Api::V1::RealEstateController < ApplicationController
  
  # 25.053871,121.460052

  def around_all_by_areas
    center_x = params[:center_x].to_f
    center_y = params[:center_y].to_f
    spot1_x = params[:spot1_x].to_f
    spot1_y = params[:spot1_y].to_f
    spot2_x = params[:spot2_x].to_f
    spot2_y = params[:spot2_y].to_f
    spot3_x = params[:spot3_x].to_f
    spot3_y = params[:spot3_y].to_f
    spot4_x = params[:spot4_x].to_f
    spot4_y = params[:spot4_y].to_f
    spot5_x = params[:spot5_x].to_f
    spot5_y = params[:spot5_y].to_f
    spot6_x = params[:spot6_x].to_f
    spot6_y = params[:spot6_y].to_f
    spot7_x = params[:spot7_x].to_f
    spot7_y = params[:spot7_y].to_f
    spot8_x = params[:spot8_x].to_f
    spot8_y = params[:spot8_y].to_f
    isShowSale = params[:isShowSale]
    isShowRent = params[:isShowRent]
    isShowPreSale = params[:isShowPreSale]

    showSaleQueryString = ""
    if isShowSale == "false"
      showSaleQueryString = "and estate_group != 1"
    end

    showRentQueryString = ""
    if isShowRent == "false"
      showRentQueryString = "and estate_group != 3"
    end

    showPreSaleQueryString = ""
    if isShowPreSale = "false"
      showPreSaleQueryString = "and estate_group != 2"
    end

    items0 = RealEstate.where("x_lat IS NOT NULL and y_long IS NOT NULL #{showSaleQueryString} #{showRentQueryString} #{showPreSaleQueryString}" ).order("(ABS(#{center_x}-x_lat) + ABS(#{center_y}-y_long)) ASC").paginate(:page => 1, :per_page => 5)
    items1 = RealEstate.where("x_lat IS NOT NULL and y_long IS NOT NULL #{showSaleQueryString} #{showRentQueryString} #{showPreSaleQueryString}" ).order("(ABS(#{spot1_x}-x_lat) + ABS(#{spot1_y}-y_long)) ASC").paginate(:page => 1, :per_page => 5)
    items2 = RealEstate.where("x_lat IS NOT NULL and y_long IS NOT NULL #{showSaleQueryString} #{showRentQueryString} #{showPreSaleQueryString}" ).order("(ABS(#{spot2_x}-x_lat) + ABS(#{spot2_y}-y_long)) ASC").paginate(:page => 1, :per_page => 5)
    items3 = RealEstate.where("x_lat IS NOT NULL and y_long IS NOT NULL #{showSaleQueryString} #{showRentQueryString} #{showPreSaleQueryString}" ).order("(ABS(#{spot3_x}-x_lat) + ABS(#{spot3_y}-y_long)) ASC").paginate(:page => 1, :per_page => 5)
    items4 = RealEstate.where("x_lat IS NOT NULL and y_long IS NOT NULL #{showSaleQueryString} #{showRentQueryString} #{showPreSaleQueryString}" ).order("(ABS(#{spot4_x}-x_lat) + ABS(#{spot4_y}-y_long)) ASC").paginate(:page => 1, :per_page => 5)
    items5 = RealEstate.where("x_lat IS NOT NULL and y_long IS NOT NULL #{showSaleQueryString} #{showRentQueryString} #{showPreSaleQueryString}" ).order("(ABS(#{spot5_x}-x_lat) + ABS(#{spot5_y}-y_long)) ASC").paginate(:page => 1, :per_page => 5)
    items6 = RealEstate.where("x_lat IS NOT NULL and y_long IS NOT NULL #{showSaleQueryString} #{showRentQueryString} #{showPreSaleQueryString}" ).order("(ABS(#{spot6_x}-x_lat) + ABS(#{spot6_y}-y_long)) ASC").paginate(:page => 1, :per_page => 5)
    items7 = RealEstate.where("x_lat IS NOT NULL and y_long IS NOT NULL #{showSaleQueryString} #{showRentQueryString} #{showPreSaleQueryString}" ).order("(ABS(#{spot7_x}-x_lat) + ABS(#{spot7_y}-y_long)) ASC").paginate(:page => 1, :per_page => 5)
    items8 = RealEstate.where("x_lat IS NOT NULL and y_long IS NOT NULL #{showSaleQueryString} #{showRentQueryString} #{showPreSaleQueryString}" ).order("(ABS(#{spot8_x}-x_lat) + ABS(#{spot8_y}-y_long)) ASC").paginate(:page => 1, :per_page => 5)
    items_all = items0 + items1 + items2 + items3 + items4 + items5 + items6 + items7 + items8
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
