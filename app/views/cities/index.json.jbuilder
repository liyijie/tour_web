json.array!(@cities) do |city|
  json.extract! city, :id, :name 
  json.image image_url(city.cover_image.photo.url(:medium)) if city.cover_image
  # json.url city_url(city, format: :json)
end
