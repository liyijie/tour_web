# == Schema Information
#
# Table name: images
#
#  id                 :integer          not null, primary key
#  desc               :string(255)
#  imageable_id       :integer
#  imageable_type     :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  photo_type         :string(255)
#

require 'rails_helper'

RSpec.describe Image, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
