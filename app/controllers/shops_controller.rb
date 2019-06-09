class ShopsController < ApplicationController
  def get_sound
    @shops = Shop.get_shops_from_cord.first(3)
    @nearest_shop = Shop.get_shops_from_cord.get_nearest_shop(params[:longitude].to_f, params[:latitude].to_f)
    ang = @nearest_shop.get_angle(params[:longitudea].to_f,params[:latitude].to_f)
    dir = get_user_dir(ang, params[:direction].to_f)
    @url = "http://aluminium-cats.s3-ap-northeast-1.amazonaws.com/cat#{@nearest_shop.id % 3 + 1}_1_#{dir}.mp3"
  end

  private
  def get_user_dir(angle, user_direction)
    return ((angle - user_direction) * 8 / 360).round.abs
  end
end
