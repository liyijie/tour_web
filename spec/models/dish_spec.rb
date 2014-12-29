# == Schema Information
#
# Table name: dishes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  price      :integer
#  shop_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Dish, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
