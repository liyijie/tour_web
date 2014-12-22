json.array!(@shops) do |shop|
  json.extract! shop, :id, :name, :addr, :tel, :special, :work_range, :price_avg
  json.url shop_url(shop, format: :json)
end
