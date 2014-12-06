# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  provice    :string(255)
#  name       :string(255)
#  desc       :text
#  position   :integer
#  created_at :datetime
#  updated_at :datetime
#  slug       :string(255)
#

class City < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  has_many :tours

  has_one :cover_image, -> { where photo_type: "cover" }, class_name: "Image", as: :imageable, dependent: :destroy
  has_one :banner_image, -> { where photo_type: "banner" }, class_name: "Image", as: :imageable, dependent: :destroy
  has_many :info_images, -> { where photo_type: "info" }, class_name: "Image", as: :imageable, dependent: :destroy

  accepts_nested_attributes_for :cover_image, :allow_destroy => true
  accepts_nested_attributes_for :banner_image, :allow_destroy => true
  accepts_nested_attributes_for :info_images, :allow_destroy => true

  # for friendly support chinese characters
  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize.to_s
  end

end
