# == Schema Information
#
# Table name: dishes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  price      :integer
#  shop_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Dish < ActiveRecord::Base
  belongs_to :shop
  
  has_one :cover_image, -> { where photo_type: "cover" }, class_name: "Image", as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :cover_image, :allow_destroy => true
end
