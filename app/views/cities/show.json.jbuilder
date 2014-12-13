json.extract! @city, :id, :name
json.image image_url(@city.app_image.photo.url) if @city.app_image
json.desc href_trans(@city.desc)
json.traffic href_trans(@city.traffic)
json.note href_trans(@city.note)
json.history href_trans(@city.history)
json.special_product href_trans(@city.special_product)
