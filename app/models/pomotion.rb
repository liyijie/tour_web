# == Schema Information
#
# Table name: pomotions
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  sub_title   :string(255)
#  content     :text
#  rate        :integer
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Pomotion < ActiveRecord::Base
  belongs_to :category
end
