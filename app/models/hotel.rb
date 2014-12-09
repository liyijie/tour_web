class Hotel < ActiveRecord::Base
  belongs_to :city

  has_one :cover_image, -> { where photo_type: "cover" }, class_name: "Image", as: :imageable, dependent: :destroy
  has_many :info_images, -> { where photo_type: "info" }, class_name: "Image", as: :imageable, dependent: :destroy
  
end
