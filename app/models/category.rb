# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  desc       :text
#  created_at :datetime
#  updated_at :datetime
#

class Category < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  has_many :pomotions

  has_one :cover_image, -> { where photo_type: "cover" }, class_name: "Image", as: :imageable, dependent: :destroy
  has_one :banner_image, -> { where photo_type: "banner" }, class_name: "Image", as: :imageable, dependent: :destroy

  accepts_nested_attributes_for :cover_image, :allow_destroy => true
  accepts_nested_attributes_for :banner_image, :allow_destroy => true

  # for friendly support chinese characters
  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize.to_s
  end
end
