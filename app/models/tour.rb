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
  belongs_to :imageable, :polymorphic => true

  accepts_nested_attributes_for :tickets, :allow_destroy => true
  accepts_nested_attributes_for :images, :allow_destroy => true

  def price
    tickets.minimum(:price)
  end
  
  def image_thumb
    images.first.photo.url(:medium) if images.first
  end

  def image_large
    images.first.photo.url if images.first
  end
end
