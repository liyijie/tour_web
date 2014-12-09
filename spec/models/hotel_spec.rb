# == Schema Information
#
# Table name: hotels
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  addr       :string(255)
#  tel        :string(255)
#  desc       :text
#  traffic    :text
#  city_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Hotel, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
