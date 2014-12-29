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

class Dish < ActiveRecord::Base
  belongs_to :shop
end
