json.extract! @category, :id, :name, :desc, :created_at, :updated_at

json.array!(@pomotions) do |pomotion|
  json.extract! pomotion, :id, :title, :sub_title, :rate
  json.image image_url(pomotion.cover_image.photo.url(:product)) if pomotion.cover_image
end
