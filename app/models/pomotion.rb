# == Schema Information
#
# Table name: pomotions
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  sub_title   :string(255)
#  content     :text
#  rate        :integer
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Pomotion < ActiveRecord::Base
  belongs_to :category

  has_one :cover_image, -> { where photo_type: "cover" }, class_name: "Image", as: :imageable, dependent: :destroy
  has_many :info_images, -> { where photo_type: "info" }, class_name: "Image", as: :imageable, dependent: :destroy
  
  accepts_nested_attributes_for :info_images, :allow_destroy => true
  accepts_nested_attributes_for :cover_image, :allow_destroy => true
end
