require 'rails_helper'

RSpec.describe "tours/index", :type => :view do
  before(:each) do
    assign(:tours, [
      Tour.create!(
        :title => "Title",
        :sub_title => "Sub Title",
        :addr => "Addr",
        :price => 1.5,
        :work_range => "Work Range",
        :hint => "hint text",
        :desc => "desc text",
        :traffic => "traffic text",
        :seq => "Seq",
        :position => 1,
        :lon => 2.5,
        :lat => 3.5,
        :city => nil
      ),
      Tour.create!(
        :title => "Title",
        :sub_title => "Sub Title",
        :addr => "Addr",
        :price => 1.5,
        :work_range => "Work Range",
        :hint => "hint text",
        :desc => "desc text",
        :traffic => "traffic text",
        :seq => "Seq",
        :position => 1,
        :lon => 2.5,
        :lat => 3.5,
        :city => nil
      )
    ])
  end

  it "renders a list of tours" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Sub Title".to_s, :count => 2
    assert_select "tr>td", :text => "Addr".to_s, :count => 2
    assert_select "tr>td", :text => "Work Range".to_s, :count => 2
    assert_select "tr>td", :text => "hint text".to_s, :count => 2
    assert_select "tr>td", :text => "desc text".to_s, :count => 2
    assert_select "tr>td", :text => "traffic text".to_s, :count => 2
    assert_select "tr>td", :text => "Seq".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
  end
end
