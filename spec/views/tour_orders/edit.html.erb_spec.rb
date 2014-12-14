require 'rails_helper'

RSpec.describe "tour_orders/edit", :type => :view do
  before(:each) do
    @tour_order = assign(:tour_order, TourOrder.create!())
  end

  it "renders the edit tour_order form" do
    render

    assert_select "form[action=?][method=?]", tour_order_path(@tour_order), "post" do
    end
  end
end
