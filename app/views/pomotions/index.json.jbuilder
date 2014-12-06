json.array!(@pomotions) do |pomotion|
  json.extract! pomotion, :id, :title, :sub_title, :content, :rate, :category_id
  json.url pomotion_url(pomotion, format: :json)
end
