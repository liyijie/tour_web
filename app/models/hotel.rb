# == Schema Information
#
# Table name: hotels
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  addr       :string(255)
#  tel        :string(255)
#  desc       :text
#  traffic    :text
#  city_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Hotel < ActiveRecord::Base
  belongs_to :city
  has_many :rooms

  has_one :cover_image, -> { where photo_type: "cover" }, class_name: "Image", as: :imageable, dependent: :destroy
  has_many :info_images, -> { where photo_type: "info" }, class_name: "Image", as: :imageable, dependent: :destroy

  acts_as_taggable_on :services, :facilities
  
  accepts_nested_attributes_for :info_images, :allow_destroy => true
  accepts_nested_attributes_for :cover_image, :allow_destroy => true

  def self.services_types
    [
      "洗衣服务",
      "接飞机/火车服务",
      "叫醒服务",
      "大巴或轿车租赁服务",
      "送餐服务"
    ]  
  end

  def self.facilities_types
    [
      "多功能会议厅",
      "电梯",
      "免费无线WiFi",
      "中餐厅",
      "网球场",
      "24小时热水",
      "西餐厅",
      "健身房",
      "空调",
      "电热水壶",
      "免费停车场",
      "自动取款机",
      "大堂吧",
      "室内游泳池",
      "液晶电视机",
      "吹风机"
    ]
  end

  def image_thumb
    cover_image.photo.url(:medium) if cover_image
  end

  def image_large
    cover_image.photo.url if cover_image
  end

  def self.relates origin, options = {}
    city = origin.city
    count = options[:count] || 3
    if origin.class == Hotel
      Hotel.where(city: city).where.not(id: origin.id).limit(count)
   else
      Hotel.where(city: city).limit(count)
    end
  end

  def price
    rooms.minimum(:price)
  end

  
end
