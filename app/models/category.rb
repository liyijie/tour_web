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
  has_one :cover_image, as: :imageable
  has_one :banner_image, as: :imageable
end
