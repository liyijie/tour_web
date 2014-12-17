json.array!(@tour_orders) do |tour_order|
  json.extract! tour_order, :id, :total_price, :state, :number, :outdate
  json.ticket_name tour_order.ticket.title
end
