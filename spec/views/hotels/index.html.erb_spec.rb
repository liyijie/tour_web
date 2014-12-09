require 'rails_helper'

RSpec.describe "hotels/index", :type => :view do
  before(:each) do
    assign(:hotels, [
      Hotel.create!(
        :name => "Name",
        :addr => "Addr",
        :tel => "Tel",
        :desc => "MyText",
        :traffic => "MyText",
        :city => nil
      ),
      Hotel.create!(
        :name => "Name",
        :addr => "Addr",
        :tel => "Tel",
        :desc => "MyText",
        :traffic => "MyText",
        :city => nil
      )
    ])
  end

  it "renders a list of hotels" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Addr".to_s, :count => 2
    assert_select "tr>td", :text => "Tel".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
