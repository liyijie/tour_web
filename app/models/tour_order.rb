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

  def sms
    timestamp = DateTime.now.strftime('%Y%m%d%H%M%S')
    url = "http://api.dsjtour.com/api/openinterface.ashx?account=ctd01@dsjtour"
    response = HTTParty.post(url, 
        :body => 
        {
          head: {
            sequenceid:"80000001",
            sign:"C0-7C-C7-6C-56-CB-AE-B3-1F-EF-0A-69-D8-79-7A-FE",
            timestamp: timestamp,
            organization:"153",
            account:"gtw01@dsjtour",
            method:"send"
          },
          body: {
            dltel: "010-52360768",
            dlurl:"www.gt278.com",
            dlname:"贵途网",
            productid:"1654",
            priceid:"6664",
            policyid:"9336",
            tel: self.user_phone,
            count:"1",
            orderid: self.token,
            usename: self.user_name,
            typeid:"0",
            tickettype:"4",
            ticketcode:"",
            zipcode:"",
            add:"",
            email:"gtw01@dsjtour",
            isbespeak:"0",
            bespeakDate: self.outdate.to_s,
            bespeakid:"0"
          }                   
        }.to_json,
        :headers => { 'Content-Type' => 'application/json' } )
    response.code == 200
  end
    


end
