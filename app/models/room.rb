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

  # only have one option, but use taggable for convinient
  acts_as_taggable_on :breakfast, :bed, :window

  def bed
    bed_list.first.to_s
  end

  def breakfast
    breakfast_list.first.to_s
  end

  def window
    window_list.first.to_s
  end

  def self.bed_types
    [
      "大床1.5米",
      "大床1.8米",
      "双床1.2米",
      "双床1.5米"
    ]
  end

  def self.breakfast_types
    [
      "无",
      "含早",
      "含双早",
      "含三早",
      "有（收费）"
    ]
  end

  def self.window_types
    [
      "有窗",
      "无窗"
    ]
  end
end
