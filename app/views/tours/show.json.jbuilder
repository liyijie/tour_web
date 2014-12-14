json.extract! @tour, :id, :title, :sub_title, :addr, :lon, :lat, :desc
json.image @tour.info_images[0].photo.url(:large) unless @tour.info_images.blank?
