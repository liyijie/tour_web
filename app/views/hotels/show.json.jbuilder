json.extract! @hotel, :id, :name, :rate, :addr, :tel, :service_list, :facility_list
json.city @hotel.city.name
json.desc href_trans(@hotel.desc)
json.traffic href_trans(@hotel.traffic)
json.cover_image image_url(@hotel.cover_image.photo.url(:large)) unless @hotel.cover_image.blank?
json.images(@hotel.info_images) do |image|
  json.image image_url(image.photo.url(:large))
end
json.rooms(@hotel.rooms) do |room|
  json.extract! room, :id, :name, :price, :area, :floor, :bed, :breakfast, :window
  json.image image_url(room.cover_image.photo.url(:medium)) unless room.cover_image.blank? 
end
