json.extract! @tour, :id, :title, :sub_title, :addr, :lon, :lat, :desc
json.image image_url(@tour.info_images[0].photo.url(:large)) unless @tour.info_images.blank?
json.tickets(@tour.tickets) do |ticket|
  json.extract! ticket, :id, :style, :title, :desc, :price 
end