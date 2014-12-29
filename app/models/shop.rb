# == Schema Information
#
# Table name: shops
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  addr       :string(255)
#  tel        :string(255)
#  special    :text
#  work_range :string(255)
#  price_avg  :float
#  created_at :datetime
#  updated_at :datetime
#  city_id    :integer
#

class Shop < ActiveRecord::Base

  belongs_to :city
  has_many :dishes

  has_one :cover_image, -> { where photo_type: "cover" }, class_name: "Image", as: :imageable, dependent: :destroy
  has_many :info_images, -> { where photo_type: "info" }, class_name: "Image", as: :imageable, dependent: :destroy
  
  accepts_nested_attributes_for :info_images, :allow_destroy => true
  accepts_nested_attributes_for :cover_image, :allow_destroy => true

  def self.relates origin, options = {}
    city = origin.city
    count = options[:count] || 3
    if origin.class == Shop
      Hotel.where(city: city).where.not(id: origin.id).limit(count)
   else
      Hotel.where(city: city).limit(count)
    end
  end
end
