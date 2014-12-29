json.array!(@hotels) do |hotel|
  json.extract! hotel, :id
  json.url hotel_url(hotel, format: :json)
end
