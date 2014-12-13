# == Schema Information
#
# Table name: cities
#
#  id              :integer          not null, primary key
#  provice         :string(255)
#  name            :string(255)
#  desc            :text
#  position        :integer
#  created_at      :datetime
#  updated_at      :datetime
#  slug            :string(255)
#  traffic         :text
#  note            :text
#  history         :text
#  special_product :text
#

require 'rails_helper'

RSpec.describe City, :type => :model do
  
end
