include Math
class ShopsController < ApplicationController
  def index
    @shops = Shop.get_shops_from_cord
  end

  def show
    @shop = Shop.find(params[:id])
  end
  def get_sound
    @shop = Shop.find(1)
    # a = Shop.find(3)
    # b = Shop.find(2)
    @ang = get_angle(111,100,180,180)
    # @ang = get_angle(a.longitude.to_f, a.latitude.to_f, b.longitude.to_f, b.latitude.to_f)
    @dir = get_user_dir(@ang)
    # @dis = get_distance(a.longitude.to_f, a.latitude.to_f, b.longitude.to_f, b.latitude.to_f)
    @url = "https://aluminium-cats.s3-ap-northeast-1.amazonaws.com/cat#{@shop.id % 3 + 1}_1_#{@dir}.mp3"
  end

  private
  def get_distance(lng1, lat1, lng2, lat2)
    x1 = lat1.to_f * PI / 180
    y1 = lng1.to_f * PI / 180
    x2 = lat2.to_f * PI / 180
    y2 = lng2.to_f * PI / 180
    
    radius = 6378.137
    diff_y = (y1 - y2).abs
    
    calc1 = cos(x2) * sin(diff_y)
    calc2 = cos(x1) * sin(x2) - sin(x1) * cos(x2) * cos(diff_y)
    
    numerator = sqrt(calc1 ** 2 + calc2 ** 2)
    denominator = sin(x1) * sin(x2) + cos(x1) * cos(x2) * cos(diff_y)
    degree = atan2(numerator, denominator)
    return degree * radius
  end

  def get_angle(lng1, lat1, lng2, lat2)
    y = cos(lng2 * PI / 180) * sin(lat2 * PI / 180 - lat1 * PI / 180)
    x = cos(lng1 * PI / 180) * sin(lng2 * PI / 180) - sin(lng1 * PI / 180) * cos(lng2 * PI / 180) * cos(lat2 * PI / 180 - lat1 * PI / 180)
    dirE0 = 180 * atan2(y, x) / PI
    if (dirE0 < 0) then
      dirE0 = dirE0 + 360
    end
    dirN0 = (dirE0 + 90) % 360
    return dirN0
  end

  def get_user_dir(angle)
     return (angle * 8 / 360).round
  end
end
