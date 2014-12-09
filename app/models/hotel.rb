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

  has_one :cover_image, -> { where photo_type: "cover" }, class_name: "Image", as: :imageable, dependent: :destroy
  has_many :info_images, -> { where photo_type: "info" }, class_name: "Image", as: :imageable, dependent: :destroy
  
  accepts_nested_attributes_for :info_images, :allow_destroy => true
  accepts_nested_attributes_for :cover_image, :allow_destroy => true
  
end
