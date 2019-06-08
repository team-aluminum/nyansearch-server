class ShopsController < ApplicationController
  def index
    @shops = Shop.get_shops_from_cord
  end

  def show
    @shop = Shop.find(params[:id])
  end
end
