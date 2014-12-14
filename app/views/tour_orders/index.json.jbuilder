json.array!(@tour_orders) do |tour_order|
  json.extract! tour_order, :id, :total_price, :state, :number, :user_id, :ticket_id, :token
  json.url tour_order_url(tour_order, format: :json)
end
