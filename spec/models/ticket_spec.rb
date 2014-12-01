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

require 'rails_helper'

RSpec.describe Ticket, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
