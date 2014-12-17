# == Schema Information
#
# Table name: tours
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  sub_title  :string(255)
#  addr       :string(255)
#  price      :float
#  work_range :string(255)
#  hint       :text
#  desc       :text
#  traffic    :text
#  seq        :string(255)
#  position   :integer
#  lon        :float
#  lat        :float
#  city_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Tour < ActiveRecord::Base
  belongs_to :city
  has_many :tickets



  has_one :cover_image, -> { where photo_type: "cover" }, class_name: "Image", as: :imageable, dependent: :destroy
  has_many :info_images, -> { where photo_type: "info" }, class_name: "Image", as: :imageable, dependent: :destroy


  accepts_nested_attributes_for :tickets, :allow_destroy => true
  accepts_nested_attributes_for :info_images, :allow_destroy => true
  accepts_nested_attributes_for :cover_image, :allow_destroy => true

  def price
    tickets.minimum(:price)
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
    if origin.class == Tour
      Tour.where(city: city).where.not(id: origin.id).limit(count)
   else
      Tour.where(city: city).limit(count)
    end
  end
end
