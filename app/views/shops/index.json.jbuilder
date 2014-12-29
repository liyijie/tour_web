json.total_pages @shops.total_pages
json.current_page @shops.current_page

json.shops(@shops) do |shop|
  json.extract! shop, :id, :name, :addr, :tel, :work_range, :price_avg
  json.cover_image image_url(shop.cover_image.photo.url(:large)) unless shop.cover_image.blank?
end
