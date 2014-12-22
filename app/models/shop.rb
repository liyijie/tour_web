# == Schema Information
#
# Table name: shops
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  addr       :string(255)
#  tel        :string(255)
#  special    :text
#  work_range :string(255)
#  price_avg  :float
#  created_at :datetime
#  updated_at :datetime
#

class Shop < ActiveRecord::Base
end
