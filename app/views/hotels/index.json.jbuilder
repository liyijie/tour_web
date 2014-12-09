json.array!(@hotels) do |hotel|
  json.extract! hotel, :id, :name, :addr, :tel, :desc, :traffic, :city_id
  json.url hotel_url(hotel, format: :json)
end
