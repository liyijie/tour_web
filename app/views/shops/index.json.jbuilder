json.array!(@shops) do |shop|
  json.extract! shop, :id, :name, :addr, :tel, :special, :work_range, :price_avg
  json.cover_image image_url(shop.cover_image.photo.url(:large)) unless shop.cover_image.blank?
end
