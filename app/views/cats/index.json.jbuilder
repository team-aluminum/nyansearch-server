json.array! @shops do |shop|
  json.extract! shop, :id, :address, :longitude, :latitude
  json.cats do
    json.array! shop.cats do |cat|
      json.extract! cat, :id, :name
    end
  end
end
