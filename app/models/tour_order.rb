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
#

class TourOrder < ActiveRecord::Base
  belongs_to :user
  belongs_to :ticket
end
