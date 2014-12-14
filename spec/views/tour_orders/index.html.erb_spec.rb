require 'rails_helper'

RSpec.describe "tour_orders/index", :type => :view do
  before(:each) do
    assign(:tour_orders, [
      TourOrder.create!(),
      TourOrder.create!()
    ])
  end

  it "renders a list of tour_orders" do
    render
  end
end
