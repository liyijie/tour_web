json.array!(@hotels) do |hotel|
  json.extract! hotel, :id, :price, :rate, :addr, :tel
  json.cover_image image_url(hotel.cover_image.photo.url(:large)) unless hotel.cover_image.blank?
end
