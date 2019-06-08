class CatsController < ApplicationController
  def index
    @shops = Shop.get_cats_from_cord
  end

  def show
    @shop = Shop.find(params[:id])
  end
end
