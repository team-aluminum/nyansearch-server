class ShopsController < ApplicationController
  def index
    @shops = Shop.get_shops_from_cord
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def get_sound
    shop = Shop.get_shops_from_cord.get_nearest_shop(params[:longitude], params[:latitude])
    ang = shop.get_angle(params[:longitudea].to_f,params[:latitude].to_f)
    dir = get_user_dir(ang)
    @url = "https://aluminium-cats.s3-ap-northeast-1.amazonaws.com/cat#{shop.id % 3 + 1}_1_#{dir}.mp3"
  end

  private
  def get_user_dir(angle)
     return (angle * 8 / 360).round
  end
end
