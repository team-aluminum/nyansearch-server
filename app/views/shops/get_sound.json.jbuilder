json.url @url
json.cats do
  json.array! @shops do |shop|
    json.extract! shop, :id, :address, :longitude, :latitude
    json.direction shop.get_angle(params[:longitudea].to_f,params[:latitude].to_f) - params[:direction].to_f
    if shop.id === @nearest_shop.id then
      json.size 3
    else
      json.size shop.id % 3 + 1
    end
    json.names do
      json.array! shop.cats do |cat|
        json.extract! cat, :id, :name
      end
    end
  end
end

