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
    salePerSquareMin = params[:salePerSquareMin]
    salePerSquareMax = params[:salePerSquareMax]
    saleTotalMin = params[:saleTotalMin]
    saleTotalMax = params[:saleTotalMax]
    saleAreaMin = params[:saleAreaMin]
    saleAreaMax = params[:saleAreaMax]

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

    salePerSquareQueryString = ""
    if salePerSquareMin.to_i != 0
      min = salePerSquareMin.to_i * 10000
      salePerSquareQueryString = "and buy_per_square_feet > #{min}"
    end

    if salePerSquareMax.to_i != 0
      max = salePerSquareMax.to_i * 10000
      salePerSquareQueryString = salePerSquareQueryString + " and buy_per_square_feet < #{max}"
    end

    saleTotalQueryString = ""
    if saleTotalMin.to_i !=0
      min = saleTotalMin.to_i * 10000
      saleTotalQueryString = "and buy_total_price > #{min}"
    end

    if saleTotalMax.to_i !=0
      max = saleTotalMax.to_i * 10000
      saleTotalQueryString = saleTotalQueryString + " and buy_total_price < #{max}"
    end

    saleAreaQueryString = ""
    if saleAreaMin.to_i != 0
      min = saleAreaMin.to_i 
      saleAreaQueryString = "and building_exchange_area > #{min}"
    end

    if saleAreaMax.to_i != 0
      max = saleAreaMax.to_i
      saleAreaQueryString = saleAreaQueryString + " and building_exchange_area < #{max}"
    end

    area_width = (spot1_x - spot4_x).abs / 2
    area_height = (spot1_y - spot2_y).abs / 2

    border0 = "and x_lat > #{center_x - area_width} and x_lat < #{center_x + area_width} and y_long > #{center_y - area_height} and y_long < #{center_y + area_height}"
    border1 = "and x_lat > #{spot1_x - area_width} and x_lat < #{spot1_x + area_width} and y_long > #{spot1_y - area_height} and y_long < #{spot1_y + area_height}"
    border2 = "and x_lat > #{spot2_x - area_width} and x_lat < #{spot2_x + area_width} and y_long > #{spot2_y - area_height} and y_long < #{spot2_y + area_height}"
    border3 = "and x_lat > #{spot3_x - area_width} and x_lat < #{spot3_x + area_width} and y_long > #{spot3_y - area_height} and y_long < #{spot3_y + area_height}"
    border4 = "and x_lat > #{spot4_x - area_width} and x_lat < #{spot4_x + area_width} and y_long > #{spot4_y - area_height} and y_long < #{spot4_y + area_height}"
    border5 = "and x_lat > #{spot5_x - area_width} and x_lat < #{spot5_x + area_width} and y_long > #{spot5_y - area_height} and y_long < #{spot5_y + area_height}"
    border6 = "and x_lat > #{spot6_x - area_width} and x_lat < #{spot6_x + area_width} and y_long > #{spot6_y - area_height} and y_long < #{spot6_y + area_height}"
    border7 = "and x_lat > #{spot7_x - area_width} and x_lat < #{spot7_x + area_width} and y_long > #{spot7_y - area_height} and y_long < #{spot7_y + area_height}"
    border8 = "and x_lat > #{spot8_x - area_width} and x_lat < #{spot8_x + area_width} and y_long > #{spot8_y - area_height} and y_long < #{spot8_y + area_height}"

    # items0 = RealEstate.where("x_lat IS NOT NULL and y_long IS NOT NULL #{showSaleQueryString} #{showRentQueryString} #{showPreSaleQueryString} #{salePerSquareQueryString} #{saleTotalQueryString} #{saleAreaQueryString} #{border0}" ).order("(ABS(#{center_x}-x_lat) + ABS(#{center_y}-y_long)) ASC").paginate(:page => 1, :per_page => 5)
    # items1 = RealEstate.where("x_lat IS NOT NULL and y_long IS NOT NULL #{showSaleQueryString} #{showRentQueryString} #{showPreSaleQueryString} #{salePerSquareQueryString} #{saleTotalQueryString} #{saleAreaQueryString} #{border1}" ).order("(ABS(#{spot1_x}-x_lat) + ABS(#{spot1_y}-y_long)) ASC").paginate(:page => 1, :per_page => 5)
    # items2 = RealEstate.where("x_lat IS NOT NULL and y_long IS NOT NULL #{showSaleQueryString} #{showRentQueryString} #{showPreSaleQueryString} #{salePerSquareQueryString} #{saleTotalQueryString} #{saleAreaQueryString} #{border2}" ).order("(ABS(#{spot2_x}-x_lat) + ABS(#{spot2_y}-y_long)) ASC").paginate(:page => 1, :per_page => 5)
    # items3 = RealEstate.where("x_lat IS NOT NULL and y_long IS NOT NULL #{showSaleQueryString} #{showRentQueryString} #{showPreSaleQueryString} #{salePerSquareQueryString} #{saleTotalQueryString} #{saleAreaQueryString} #{border3}" ).order("(ABS(#{spot3_x}-x_lat) + ABS(#{spot3_y}-y_long)) ASC").paginate(:page => 1, :per_page => 5)
    # items4 = RealEstate.where("x_lat IS NOT NULL and y_long IS NOT NULL #{showSaleQueryString} #{showRentQueryString} #{showPreSaleQueryString} #{salePerSquareQueryString} #{saleTotalQueryString} #{saleAreaQueryString} #{border4}" ).order("(ABS(#{spot4_x}-x_lat) + ABS(#{spot4_y}-y_long)) ASC").paginate(:page => 1, :per_page => 5)
    # items5 = RealEstate.where("x_lat IS NOT NULL and y_long IS NOT NULL #{showSaleQueryString} #{showRentQueryString} #{showPreSaleQueryString} #{salePerSquareQueryString} #{saleTotalQueryString} #{saleAreaQueryString} #{border5}" ).order("(ABS(#{spot5_x}-x_lat) + ABS(#{spot5_y}-y_long)) ASC").paginate(:page => 1, :per_page => 5)
    # items6 = RealEstate.where("x_lat IS NOT NULL and y_long IS NOT NULL #{showSaleQueryString} #{showRentQueryString} #{showPreSaleQueryString} #{salePerSquareQueryString} #{saleTotalQueryString} #{saleAreaQueryString} #{border6}" ).order("(ABS(#{spot6_x}-x_lat) + ABS(#{spot6_y}-y_long)) ASC").paginate(:page => 1, :per_page => 5)
    # items7 = RealEstate.where("x_lat IS NOT NULL and y_long IS NOT NULL #{showSaleQueryString} #{showRentQueryString} #{showPreSaleQueryString} #{salePerSquareQueryString} #{saleTotalQueryString} #{saleAreaQueryString} #{border7}" ).order("(ABS(#{spot7_x}-x_lat) + ABS(#{spot7_y}-y_long)) ASC").paginate(:page => 1, :per_page => 5)
    # items8 = RealEstate.where("x_lat IS NOT NULL and y_long IS NOT NULL #{showSaleQueryString} #{showRentQueryString} #{showPreSaleQueryString} #{salePerSquareQueryString} #{saleTotalQueryString} #{saleAreaQueryString} #{border8}" ).order("(ABS(#{spot8_x}-x_lat) + ABS(#{spot8_y}-y_long)) ASC").paginate(:page => 1, :per_page => 5)

    items0 = RealEstate.where("x_lat IS NOT NULL and y_long IS NOT NULL #{showSaleQueryString} #{showRentQueryString} #{showPreSaleQueryString} #{salePerSquareQueryString} #{saleTotalQueryString} #{saleAreaQueryString} #{border0}" ).paginate(:page => 1, :per_page => 10)
    items1 = RealEstate.where("x_lat IS NOT NULL and y_long IS NOT NULL #{showSaleQueryString} #{showRentQueryString} #{showPreSaleQueryString} #{salePerSquareQueryString} #{saleTotalQueryString} #{saleAreaQueryString} #{border1}" ).paginate(:page => 1, :per_page => 10)
    items2 = RealEstate.where("x_lat IS NOT NULL and y_long IS NOT NULL #{showSaleQueryString} #{showRentQueryString} #{showPreSaleQueryString} #{salePerSquareQueryString} #{saleTotalQueryString} #{saleAreaQueryString} #{border2}" ).paginate(:page => 1, :per_page => 10)
    items3 = RealEstate.where("x_lat IS NOT NULL and y_long IS NOT NULL #{showSaleQueryString} #{showRentQueryString} #{showPreSaleQueryString} #{salePerSquareQueryString} #{saleTotalQueryString} #{saleAreaQueryString} #{border3}" ).paginate(:page => 1, :per_page => 10)
    items4 = RealEstate.where("x_lat IS NOT NULL and y_long IS NOT NULL #{showSaleQueryString} #{showRentQueryString} #{showPreSaleQueryString} #{salePerSquareQueryString} #{saleTotalQueryString} #{saleAreaQueryString} #{border4}" ).paginate(:page => 1, :per_page => 10)
    items5 = RealEstate.where("x_lat IS NOT NULL and y_long IS NOT NULL #{showSaleQueryString} #{showRentQueryString} #{showPreSaleQueryString} #{salePerSquareQueryString} #{saleTotalQueryString} #{saleAreaQueryString} #{border5}" ).paginate(:page => 1, :per_page => 10)
    items6 = RealEstate.where("x_lat IS NOT NULL and y_long IS NOT NULL #{showSaleQueryString} #{showRentQueryString} #{showPreSaleQueryString} #{salePerSquareQueryString} #{saleTotalQueryString} #{saleAreaQueryString} #{border6}" ).paginate(:page => 1, :per_page => 10)
    items7 = RealEstate.where("x_lat IS NOT NULL and y_long IS NOT NULL #{showSaleQueryString} #{showRentQueryString} #{showPreSaleQueryString} #{salePerSquareQueryString} #{saleTotalQueryString} #{saleAreaQueryString} #{border7}" ).paginate(:page => 1, :per_page => 10)
    items8 = RealEstate.where("x_lat IS NOT NULL and y_long IS NOT NULL #{showSaleQueryString} #{showRentQueryString} #{showPreSaleQueryString} #{salePerSquareQueryString} #{saleTotalQueryString} #{saleAreaQueryString} #{border8}" ).paginate(:page => 1, :per_page => 10)

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
