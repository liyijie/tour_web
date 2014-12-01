# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  provice    :string(255)
#  name       :string(255)
#  desc       :text
#  position   :integer
#  created_at :datetime
#  updated_at :datetime
#  slug       :string(255)
#

class City < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  has_many :tours

  # for friendly support chinese characters
  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize.to_s
  end

end
