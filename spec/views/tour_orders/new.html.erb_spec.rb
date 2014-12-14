require 'rails_helper'

RSpec.describe "tour_orders/new", :type => :view do
  before(:each) do
    assign(:tour_order, TourOrder.new())
  end

  it "renders new tour_order form" do
    render

    assert_select "form[action=?][method=?]", tour_orders_path, "post" do
    end
  end
end
