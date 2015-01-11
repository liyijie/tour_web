json.total_pages @hotels.total_pages
json.current_page @hotels.current_page

json.hotels(@hotels) do |hotel|
  json.extract! hotel, :id, :name, :price, :rate, :addr, :tel
  json.cover_image image_url(hotel.cover_image.photo.url(:large)) unless hotel.cover_image.blank?
end
