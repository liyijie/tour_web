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

class TourOrder < ActiveRecord::Base
  belongs_to :user
  belongs_to :ticket

  include AASM

  validates_presence_of :ticket
  validates_presence_of :user
  validates_uniqueness_of :token

  before_create :cal_price
  before_save :generate_token

  aasm :column => :state do
    state :in_progress, :initial => true
    state :completed
    state :paid
    state :canceled

    event :complete do
      transitions :from => :paid, :to => :completed
    end

    event :pay do
      transitions :from => :in_progress, :to => :paid
    end

    event :cancel do
      transitions :from => :in_progress, :to => :canceled
    end

    event :refund do
      transitions :from => :paid, :to => :canceled
    end
  end

  def cal_price
    self.total_price = ticket.price * number
  end

  # 共 24 位(8 位当前日期 + 9 位纳秒 + 1 位随机数)
  def generate_token
    time = Time.now
    if self.token.blank?
      self.token = time.to_s(:number) + time.nsec.to_s + Random.new.rand(1..9).to_s
    end
  end


end
