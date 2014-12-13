# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  desc       :text
#  created_at :datetime
#  updated_at :datetime
#  slug       :string(255)
#

require 'rails_helper'

RSpec.describe Category, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
