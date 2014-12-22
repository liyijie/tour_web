require 'rails_helper'

RSpec.describe "shops/index", :type => :view do
  before(:each) do
    assign(:shops, [
      Shop.create!(
        :name => "Name",
        :addr => "Addr",
        :tel => "Tel",
        :special => "MyText",
        :work_range => "Work Range",
        :price_avg => 1.5
      ),
      Shop.create!(
        :name => "Name",
        :addr => "Addr",
        :tel => "Tel",
        :special => "MyText",
        :work_range => "Work Range",
        :price_avg => 1.5
      )
    ])
  end

  it "renders a list of shops" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Addr".to_s, :count => 2
    assert_select "tr>td", :text => "Tel".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Work Range".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
