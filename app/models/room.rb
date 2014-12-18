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
end
