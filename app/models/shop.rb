class Shop < ApplicationRecord
  has_many :cats

  LONGTITUDE_DIFF = 30000
  LATITUDE_DIFF = 30000
  def self.get_shops_from_cord(lon = 0, lat = 0)
    self.where(['? < longitude < ? and ? < latitude < ?', (lon - LONGTITUDE_DIFF), (lon + LONGTITUDE_DIFF), (lat - LATITUDE_DIFF), (lat + LATITUDE_DIFF)])
  end
end
