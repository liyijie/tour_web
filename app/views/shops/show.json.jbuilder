json.extract! @shop, :id, :name, :addr, :tel, :special, :work_range, :price_avg
json.city @shop.city.name
json.cover_image image_url(@shop.cover_image.photo.url(:large)) unless @shop.cover_image.blank?
json.images(@shop.info_images) do |image|
  json.image image_url(image.photo.url(:large))
end

json.dishes(@shop.dishes) do |dish|
  json.extract! dish, :id, :name, :price
  json.image image_url(dish.cover_image.photo.url(:medium)) unless dish.cover_image.blank?
end
