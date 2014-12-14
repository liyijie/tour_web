json.total_pages @tours.total_pages
json.current_page @tours.current_page
json.tours(@tours) do |tour|
  json.extract! tour, :id, :title, :sub_title, :addr, :price
end
