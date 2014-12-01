# == Schema Information
#
# Table name: images
#
#  id             :integer          not null, primary key
#  desc           :string(255)
#  imageable_id   :integer
#  imageable_type :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class Image < ActiveRecord::Base
  belongs_to :imageable
end
