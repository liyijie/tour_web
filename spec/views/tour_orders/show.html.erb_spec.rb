require 'rails_helper'

RSpec.describe "tour_orders/show", :type => :view do
  before(:each) do
    @tour_order = assign(:tour_order, TourOrder.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
