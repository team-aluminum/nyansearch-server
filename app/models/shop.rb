include Math
class Shop < ApplicationRecord
  has_many :cats

  LONGTITUDE_DIFF = 30000
  LATITUDE_DIFF = 30000
  def self.get_shops_from_cord(lon = 0, lat = 0)
    self.where(['? < longitude < ? and ? < latitude < ?', (lon - LONGTITUDE_DIFF), (lon + LONGTITUDE_DIFF), (lat - LATITUDE_DIFF), (lat + LATITUDE_DIFF)])
  end

  def self.get_nearest_shop(lng, lat)
    shops = Shop.get_shops_from_cord
    shop_tmp = shops.first
    smallest_distance = 100000
    shops.find_each do |shop|
      distance_tmp = shop.get_distance(lng,lat)
      if (smallest_distance > distance_tmp) then
        smallest_distance = distance_tmp
        shop_tmp = shop
      end
    end
    return shop_tmp
  end

  def get_distance(lng, lat)
    x1 = lat.to_f * PI / 180
    y1 = lng.to_f * PI / 180
    x2 = self.latitude.to_f * PI / 180
    y2 = self.longitude.to_f * PI / 180
    
    radius = 6378.137
    diff_y = (y1 - y2).abs
    
    calc1 = cos(x2) * sin(diff_y)
    calc2 = cos(x1) * sin(x2) - sin(x1) * cos(x2) * cos(diff_y)
    
    numerator = sqrt(calc1 ** 2 + calc2 ** 2)
    denominator = sin(x1) * sin(x2) + cos(x1) * cos(x2) * cos(diff_y)
    degree = atan2(numerator, denominator)
    return degree * radius # km
  end

  def get_angle(lng1, lat1)
    lng2 = self.longitude.to_f
    lat2 = self.latitude.to_f
    dirE0 = 180 * atan2(cos(lng2 * PI / 180) * sin(lat2 * PI / 180 - lat1 * PI / 180), cos(lng1 * PI / 180) * sin(lng2 * PI / 180) - sin(lng1 * PI / 180) * cos(lng2 * PI / 180) * cos(lat2 * PI / 180 - lat1 * PI / 180)) / PI
    if (dirE0 < 0) then
      dirE0 = dirE0 + 360
    end
    dirN0 = (dirE0 + 90 * self.id * self.id) % 360
    return dirN0
  end
end
