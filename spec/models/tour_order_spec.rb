# == Schema Information
#
# Table name: tour_orders
#
#  id          :integer          not null, primary key
#  total_price :float
#  state       :string(255)
#  number      :integer
#  user_id     :integer
#  ticket_id   :integer
#  token       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  outdate     :date
#  user_phone  :string(255)
#  user_name   :string(255)
#

require 'rails_helper'

RSpec.describe TourOrder, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
