json.array!(@tours) do |tour|
  json.extract! tour, :id, :title, :sub_title, :addr, :price, :work_range, :hint, :desc, :traffic, :seq, :position, :lon, :lat, :city_id
  json.url tour_url(tour, format: :json)
end
