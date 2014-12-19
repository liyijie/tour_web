# == Schema Information
#
# Table name: rooms
#
#  id         :integer          not null, primary key
#  hotel_id   :integer
#  name       :string(255)
#  price      :float
#  area       :string(255)
#  floor      :string(255)
#  bed        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Room < ActiveRecord::Base
  belongs_to :hotel

  has_one :cover_image, -> { where photo_type: "cover" }, class_name: "Image", as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :cover_image, :allow_destroy => true

end
