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

require 'rails_helper'

RSpec.describe Room, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
