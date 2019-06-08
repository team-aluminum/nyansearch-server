json.array! @shops do |shop|
  json.extract! shop, :id, :address, :longtitude, :latitude
  json.array! shop.cats do |cat|
    json.extract! cat, :id, :name
  end
end
