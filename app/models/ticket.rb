# == Schema Information
#
# Table name: tickets
#
#  id         :integer          not null, primary key
#  style      :string(255)
#  title      :string(255)
#  desc       :text
#  price      :float
#  position   :integer
#  tour_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Ticket < ActiveRecord::Base
  belongs_to :tour
end
