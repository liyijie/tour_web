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

require 'rails_helper'

RSpec.describe Tour, :type => :model do
  
end
